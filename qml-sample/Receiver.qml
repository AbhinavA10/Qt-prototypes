import QtQuick 2.0

Circle {
 id: receiveButton
 function receive(value){ // the slot for when we receive a signal
     displayText= value
     clickNotify.running=true // start the animation
 }
 SequentialAnimation on buttonColor {
     id: clickNotify
     running:false // dont want the animation to start running until we trigger it


     ColorAnimation {
         from: "red"
         to: "blue"
         duration: 250 // in ms
     }

     ColorAnimation {
         from: "blue"
         to: "red"
         duration: 250
     }
 }
}
