/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2
import bb.data 1.0

Page {
    Container {
        //Todo: fill me with QML
        ListView {
            dataModel: theModel
            /*
            layout: GridListLayout {
                columnCount: 2
                cellAspectRatio: 1
            }
            */
            
            listItemComponents: [
                ListItemComponent {
                    type: "item"
                    Container {
                        
                    Label {
                        text: ListItemData.b
                    }
                }
                }
            ]
        }
        
        attachedObjects: [
            GroupDataModel {
                id: theModel
                sortingKeys: ["a"];
            },
            DataSource {
                id: aSource
                source: "asset:///test.json"
                
                onDataLoaded: {
                    console.log("data = " + data.tests[0].b);
                    theModel.insertList(data.tests)
                }
                onError: {
                    
                    console.log("errore ci fu" + errorMessage);
                }
                
            }
        ]
    }
    
    onCreationCompleted: {
        aSource.load();
    }
}
