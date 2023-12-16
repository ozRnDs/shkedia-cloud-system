# Overview

# Media Sub-system
The media sub-system is responsible to handle the media file and the basic meta-data. It includes the following tasks:  
1. Uploading the Media file from the users phone.
2. Encrypting and Decrypting the media
3. Storing the Media in the storage (S3 in our case)
4. Storing the meta-data in the db
5. Fetch and display all the media to the user using a web-app.

# Insights Sub-system
The insights sub-system is responsible to enrich the information about the medias. It includes the following tasks:  
1. Extracting object from the images
2. Classification of images (Relevant/Trash)
3. Ranking the images quality
4. Creating collections (albums) based on the new enrich data.
5. Find duplicates

## Simple Categorization (Albums)
The system should create albums automatically.
Type of albums we expect to find:
1. Months
2. Places
3. Events
4. Persons
5. Spam/Not Spam
6. Inside/Outside
The albums could be used as filters to search and organized the media.
Each insight-type/category will be "calculated" by an insight-engine, a component that will be have the logic to classify the media.

## Common scenarios
The sub-system will work in async architecture using the following flow. It will be base on queues and workers (the insight-engines) that will consume those queues.
### Queue Architecture
Each insight-engine has input queue and output exchange. Some of the engines need the original image as input, the others need a specific insight to work one.  
Example: Yolov7 need full image, Face detection will need a person's image (yolov7 insight).  
Therefor, Each engine will lister to a specific exchanges defined in it's definitions in the db.
### New Image
1. The Upload component will add new media file to a "new-image" exchange.
2. Insights controller will consume that new-image and will update the jobs table with that new-image as pending.
3. The existing insight-engines that bound their queue to that exchange will analyze the media.
4. The engines will publish the result to the their exchange that is bound to the global-output queue and open to other bindings as well.
5. A db-writer, consumes the global-output queue and writes the insights to the db. It will try to aggregate the writes in order to minimize actions to the db.
### New Insight-Engine
1. The worker binds it's queue to the defined exchanges (eg: new-image, insight-yolov7-output). It should be able to register to multiple insights
2. The worker binds it's own output exchange to the global-output queue.
3. The worker start consumes job from it's own queues.
4. During it's schedule, the main controller discover new insight-engine in the pipeline.
5. The main controller searches all the images in the db that don't have records with the new insight and will initiate one.