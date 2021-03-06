/* Copyright (c) 2012 Research In Motion Limited.
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

Page {
    id: root

    titleBar: TitleBar {
        title: qsTr ("Event Details")
    }

    Container {
        layout: DockLayout {}

        // The background image
        ImageView {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill

            imageSource: "asset:///images/background.png"
        }

        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Top

            leftPadding: 30
            topPadding: 100
            rightPadding: 30

            //! [0]
            ViewerField {
                horizontalAlignment: HorizontalAlignment.Fill
                title: qsTr ("subject")
                value: _calendar.eventViewer.subject
            }

            ViewerField {
                horizontalAlignment: HorizontalAlignment.Fill
                topMargin: 50

                title: qsTr ("location")
                value: _calendar.eventViewer.location
            }
            //! [0]

            ViewerField {
                horizontalAlignment: HorizontalAlignment.Fill
                topMargin: 50

                title: qsTr ("start time")
                value: _calendar.eventViewer.startTime
            }

            ViewerField {
                horizontalAlignment: HorizontalAlignment.Fill
                topMargin: 50

                title: qsTr ("end time")
                value: _calendar.eventViewer.endTime
            }
        }
    }

    //! [1]
    actions: [
        ActionItem {
            title: qsTr ("Edit")
            imageSource: "asset:///images/action_editevent.png"

            onTriggered: {
                _calendar.editEvent()
                navigationPane.push(eventEditor.createObject())
            }
        },
        DeleteActionItem {
            onTriggered: {
                _calendar.deleteEvent()

                navigationPane.pop()
            }
        }
    ]
    //! [1]

    //! [2]
    attachedObjects: [
        ComponentDefinition {
            id: eventEditor
            source: "EventEditor.qml"
        }
    ]
    //! [2]
}
