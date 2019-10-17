//$fa = 0.5;
$fs = 0.5;

//printerSettings
printerOffset = 0.2;
caseThickness = 1.5;
layerHeight = 0.16;

//bottompcb
bottomPcbThickness = 1+printerOffset/2;
bottomPcbWidth = 45;
bottomPcbHeight = 38.2;
bottomEdgeDiameter = 4.5;

//wristband
wristbandHolderWidth = 6;
wristbandHolderHeight = 0.6;
wristbandHolderHeightAroundScrew = 0.2;
wristbandHolderInsetY = 0.5;

//contactPins
contactPinWidth = 33;
contactPinHeigth = 3;
contactPinDistanceX = 6;

//screws
bottomScrewDistanceX = 3;
bottomScrewDistanceY = 4.5;
topScrewDistanceX = bottomScrewDistanceX;
topScrewDistanceY = 3.25;
ScrewDistanceX = 39;
ScrewDistanceY = 29;
screwHeadDiameter = 4+printerOffset;
screwHeadHeight = 0.5;
screwDiameter = 2;

//spacer
distancePcbs = 5;
topPcbOffset = bottomScrewDistanceY-topScrewDistanceY;

//topPcb
topCaseThickness = 2;
topPcbWidth = bottomPcbWidth;
topPcbHeight = 35.7;
topPcbEdgeDiameter = 2.75;
topPcbThickness = bottomPcbThickness;

//buttons
buttonHeight = 1.5;
buttonWidth = 3.8+printerOffset;
buttonDepth = 3.2+printerOffset;
buttonSolderPadsWidth = 1;
buttonSolderPadHeight = buttonHeight/2;

//buttonPositions
button1x = 0;
button1Y = 23.5-printerOffset/2;

button2x = 0;
button2Y = 7.8-printerOffset/2;

button3x = topPcbWidth-buttonDepth+printerOffset/2;
button3Y = 7-printerOffset/2;

button4x = topPcbWidth-buttonDepth+printerOffset/2;
button4Y = 13-printerOffset/2;

//display and connector
displayHeight = 13.5+printerOffset*2;
displayWidth = 28+printerOffset*2;
displayThickness = topCaseThickness-layerHeight;
displayCableHeight = 9+printerOffset;
displayCableWidth = 2+printerOffset;

//please check those two values, may vary due to flexible mount
//measured from top pcb corner to corner of display (both bottom-left)
displayPositionX = 8.5-printerOffset;
displayPositionY = 12-printerOffset;
displayCablePositonY = 2-printerOffset/2;

//actual visible area of display
displayBacklightHeight = 11.5;
displayBacklightWidth = 22.5;
//position of visible area relative to bottom-left corner of display
displayBacklightPosX = 4.6;
displayBacklightPosY = 1.3;

//Heartbeat sensor
sensorHeight = 3.6 + printerOffset;
sensorWidth = 5.8 + printerOffset;
sensorThickness = 1.5;
sensorPosX = 23.1 - printerOffset/2; //23
sensorPosY = 2.5 -printerOffset/2; //2.8
heartbeatSensorOvalDiameter = 12;

//frontResistor
resistorHeight = 1.2 + printerOffset;
resistorWidth = 2.6;
resistorDepth = 1.2;
resistorX = 27.5;
resistorY = 31;

//frontLed/ir sensor
ledHeight = resistorHeight;
ledWidth = resistorWidth;
ledThickness = topCaseThickness+1; //-0.15
ledPosX = resistorX + 3;
ledPosY = resistorY;

//rgbLeds
rgbLedsHeight = 2.25+printerOffset;
rgbLedsWidth = 2.25+printerOffset;
rgbLedsThickness = topCaseThickness-layerHeight;
rgbLedsBeginPosX = 6.7-printerOffset/2;
//LEFT edge of the last rgbLed
rgbLedsEndPosX = 36-printerOffset/2;
rgbLedsPosY = 33-printerOffset/2;
rgbLedsNumber = 11;
rgbLedsDistance = (rgbLedsEndPosX-rgbLedsBeginPosX)/(rgbLedsNumber-1);

//card10 finger contact pins
contactPinSmallDiameter = 8;
contactPinLargeDiameter = 12;
conatctPinThickness = topCaseThickness;
contactPinLeftX = 16;
contactPinRightX = 32.5;
contactPinY = 4.5;
contactPinScaleYFactor = 0.8;

//rocket leds
rocketRoundPosX = 6;
rocketRoundPosY = 19.5;
rocketLinesPosX = 20.5;
rocketLinesPosY = 30;
rocketLeafPosX = 38.5;
rocketLeadPosY = 15;

//jumperSpare
jumperHeight = 2+printerOffset;
jumperWidth = 3+printerOffset;
jumperThickness = 1;
jumperPosX = 39-printerOffset/2;
jumperPosY = 18.3-printerOffset/2;

//klicker
klickerDistance = 0.9;
klickerLength = 5;
klickerMountWidth = 2;
klickerArmThickness = 1;
klickerCylinderPosX = 5;
klickerCylinderMaxWidth = 1;
klickerCylinderScaleFactor = 0.5;
klickerAngle = 30;

//sideCover
sideCoverHeight = bottomPcbThickness+topPcbThickness+distancePcbs-printerOffset;
sideCoverThickness = caseThickness;

//typeC
typeCHeight = 3.2+printerOffset;
typeCWidth = 9+printerOffset;
typeCPosY = 19.5+topPcbOffset; //fromTopPlate

//pcbOverhangs
pcbOverhangThickness = 2;
pcbOverhangDepth = 1;
pcbOverhangPosY = 18;

//pcb spacer
spacerThickness = 3;
spacerHeight = distancePcbs;
spacerInnerDiameter = 1.6 + printerOffset;

//choose which elements to display
//bottom cover
    //bottomPcbCover();
//top cover  
    //positionedTopCover();
    //topCover();
//side cover
    //positionedSideCover();
    sideCover();
//whole case
    //case();
    
//Spacer
    //positionedSpacer();
    //pcbSpacerHex();
    

module case(){
    positionedTopCover();
    positionedSideCover();
    bottomPcbCover();
}
    
module positionedTopCover(){
    translate([0,0,distancePcbs+bottomPcbThickness+topPcbThickness+caseThickness])topCover();
}

module positionedSideCover(){
    translate([0,0,caseThickness+printerOffset/2])sideCover();
}

module positionedSpacer(){
    translate([bottomScrewDistanceX+ScrewDistanceX,bottomScrewDistanceY,caseThickness+bottomPcbThickness+spacerHeight/2+printerOffset/2])pcbSpacerHex();
}

module bottomPcbCover(){
    difference(){
        hull(){
            difference(){
                cube([bottomPcbWidth,bottomPcbHeight,caseThickness]);
                //edge cutting
                rotate([0,0,180])bottomEdgeNegative();
                translate([bottomPcbWidth,bottomPcbHeight,0])rotate([0,0,0])bottomEdgeNegative();
                translate([0,bottomPcbHeight,0])rotate([0,0,90])bottomEdgeNegative();
                translate([bottomPcbWidth,0,0])rotate([0,0,-90])bottomEdgeNegative();
            }
            translate([0,0,caseThickness-0.1])sideCoverRaw(0.1);
        }

        //screw cuttings
        translate([bottomScrewDistanceX,bottomScrewDistanceY,-wristbandHolderHeightAroundScrew])screwNegative(caseThickness);
        translate([bottomScrewDistanceX+ScrewDistanceX,bottomScrewDistanceY,-wristbandHolderHeightAroundScrew])screwNegative(caseThickness);
        translate([bottomScrewDistanceX,bottomScrewDistanceY+ScrewDistanceY,-wristbandHolderHeightAroundScrew])screwNegative(caseThickness);
        translate([bottomScrewDistanceX+ScrewDistanceX,bottomScrewDistanceY+ScrewDistanceY,-wristbandHolderHeightAroundScrew])screwNegative(caseThickness);
    
        //wristbandCuttings
        translate([contactPinDistanceX,-contactPinHeigth,0])cube([contactPinWidth,bottomPcbHeight*2,caseThickness]);
        
        
        translate([bottomScrewDistanceX,bottomScrewDistanceY-wristbandHolderInsetY,caseThickness-wristbandHolderHeight])cube([ScrewDistanceX,wristbandHolderWidth,wristbandHolderHeight]);
        
        translate([bottomScrewDistanceX,bottomScrewDistanceY + ScrewDistanceY - wristbandHolderWidth+wristbandHolderInsetY,caseThickness-wristbandHolderHeight])cube([ScrewDistanceX,wristbandHolderWidth,wristbandHolderHeight]);
        
        translate([0,bottomScrewDistanceY-wristbandHolderWidth/2,caseThickness-wristbandHolderHeightAroundScrew])cube([bottomPcbWidth,wristbandHolderWidth*1.5-wristbandHolderInsetY,wristbandHolderHeightAroundScrew]);
        
        translate([0,bottomScrewDistanceY+wristbandHolderWidth/2+ScrewDistanceY-(wristbandHolderWidth*1.5-wristbandHolderInsetY),caseThickness-wristbandHolderHeightAroundScrew])cube([bottomPcbWidth,wristbandHolderWidth*1.5-wristbandHolderInsetY,wristbandHolderHeightAroundScrew]);
    
    }
    
    //typeC overlap
    translate([-sideCoverThickness-printerOffset,typeCPosY+printerOffset,caseThickness])cube([sideCoverThickness,typeCWidth-printerOffset*2,bottomPcbThickness]);
}

module bottomPcbCoverFull(){
    difference(){
        hull(){
            difference(){
                cube([bottomPcbWidth,bottomPcbHeight,caseThickness]);
                //edge cutting
                rotate([0,0,180])bottomEdgeNegative();
                translate([bottomPcbWidth,bottomPcbHeight,0])rotate([0,0,0])bottomEdgeNegative();
                translate([0,bottomPcbHeight,0])rotate([0,0,90])bottomEdgeNegative();
                translate([bottomPcbWidth,0,0])rotate([0,0,-90])bottomEdgeNegative();
            }
            translate([0,0,caseThickness-0.1])sideCoverRaw(0.1);
        }

        //screw cuttings
        translate([bottomScrewDistanceX,bottomScrewDistanceY,0])screwNegative(caseThickness);
        translate([bottomScrewDistanceX+ScrewDistanceX,bottomScrewDistanceY,0])screwNegative(caseThickness);
        translate([bottomScrewDistanceX,bottomScrewDistanceY+ScrewDistanceY,0])screwNegative(caseThickness);
        translate([bottomScrewDistanceX+ScrewDistanceX,bottomScrewDistanceY+ScrewDistanceY,0])screwNegative(caseThickness);
    
        //contactPinCuttings
        translate([contactPinDistanceX,-contactPinHeigth,0])cube([contactPinWidth,contactPinHeigth*2,caseThickness]);
        translate([contactPinDistanceX,bottomPcbHeight-contactPinHeigth,0])cube([contactPinWidth,contactPinHeigth*2,caseThickness]);
    
    }
    
    //typeC overlap
    translate([-sideCoverThickness-printerOffset,typeCPosY+printerOffset,caseThickness])cube([sideCoverThickness,typeCWidth-printerOffset*2,bottomPcbThickness]);
}

module bottomEdgeNegative(){
    translate([-bottomEdgeDiameter,-bottomEdgeDiameter,0]) difference(){
        cube([bottomEdgeDiameter,bottomEdgeDiameter,caseThickness]);
        cylinder(r=bottomEdgeDiameter, h=caseThickness);
    }
}

module topEdgeNegative(){
    translate([-topPcbEdgeDiameter,-topPcbEdgeDiameter,0]) difference(){
        cube([topPcbEdgeDiameter,topPcbEdgeDiameter,topCaseThickness]);
        cylinder(r=topPcbEdgeDiameter, h=topCaseThickness);
    }
}



module topCover(){
    union(){
        difference(){
            hull(){
                translate([0,topPcbOffset,0]) difference(){
                    cube([topPcbWidth,topPcbHeight,topCaseThickness]);
                    //edge cutting
                    rotate([0,0,180])topEdgeNegative();
                    translate([topPcbWidth,topPcbHeight,0])rotate([0,0,0])topEdgeNegative();
                    translate([0,topPcbHeight,0])rotate([0,0,90])topEdgeNegative();
                    translate([topPcbWidth,0,0])rotate([0,0,-90])topEdgeNegative();
                }
                sideCoverRaw(0.1);
            }
       
            translate([0,topPcbOffset,0]){
                //screw cuttings
                translate([topScrewDistanceX,topScrewDistanceY,0])screwNegativeRotated(topCaseThickness);

                translate([topScrewDistanceX+ScrewDistanceX,topScrewDistanceY,0])screwNegativeRotated(topCaseThickness);


                translate([topScrewDistanceX,topScrewDistanceY+ScrewDistanceY,0])screwNegativeRotated(topCaseThickness);


                translate([topScrewDistanceX+ScrewDistanceX,topScrewDistanceY+ScrewDistanceY,0])screwNegativeRotated(topCaseThickness);
    
                //button cutting
                translate([button1x,button1Y+buttonWidth,0]) mirror([0,1,0])buttonNegative();
                translate([button2x,button2Y,0]) buttonNegative();
                translate([button3x+buttonDepth,button3Y,0]) mirror([1,0,0])buttonNegative();
                translate([button4x+buttonDepth,button4Y+buttonWidth,0]) mirror([0,1,0]) mirror([1,0,0])buttonNegative();
    
                translate([displayPositionX,displayPositionY,0])displayNegative();
    
                //Heartbeat sensor cutting
                negativeHeartbeatSensor();

                //jumper-solder pads on the right of the display
                translate([jumperPosX,jumperPosY,0])cube([jumperWidth,jumperHeight,jumperThickness]);
                
                //front irLed-transceiver
                translate([ledPosX,ledPosY,0])cube([ledWidth,ledHeight,ledThickness]);
                
                //front resistor on the left of irLed
                translate([resistorX,resistorY,0])cube([resistorWidth,resistorHeight,resistorDepth]);
                
                for (rgbLedNr = [0:rgbLedsNumber-1]) { 
                    translate([rgbLedsBeginPosX+rgbLedsDistance*rgbLedNr,rgbLedsPosY,0])cube([rgbLedsWidth,rgbLedsHeight,rgbLedsThickness]);
                }
                
                //contactPins for card10 ecg sensor
                contactPinsNegative();
               
                //cutouts rocket leds
                translate([rocketRoundPosX,rocketRoundPosY,0])cutoutsRocketLed();
                translate([rocketLinesPosX,rocketLinesPosY,0])rotate([0,0,90])cutoutsRocketLed();
                translate([rocketLeafPosX,rocketLeadPosY,0])cutoutsRocketLed();
            }
    
        }
        translate([0,topPcbOffset,0]){
            translate([button1x,button1Y+buttonWidth,0]) mirror([0,1,0])klicker();
            translate([button2x,button2Y,0]) klicker();
            translate([bottomPcbWidth,button3Y,0]) mirror([1,0,0])klicker();
            translate([bottomPcbWidth,button4Y+buttonWidth,0]) mirror([0,1,0]) mirror([1,0,0])klicker();
         }
            
    }
}

module negativeHeartbeatSensor(){
    translate([sensorPosX,sensorPosY,0])cube([sensorWidth,sensorHeight,sensorThickness]);
    
    hull(){
        translate([sensorPosX,sensorPosY,sensorThickness])
        cube([sensorWidth,sensorHeight,0.01]);
    
        translate([sensorPosX+sensorWidth/2,sensorPosY+sensorHeight/2,topCaseThickness])cylinder(d=heartbeatSensorOvalDiameter, h=0.01);
    }
    
}

module contactPinsNegative(){
    hull(){
        translate([contactPinLeftX,contactPinY,0])scale([1,contactPinScaleYFactor,1])cylinder(d1=contactPinSmallDiameter,d2=contactPinLargeDiameter,h=conatctPinThickness);
        translate([contactPinLeftX-contactPinLargeDiameter/2,-caseThickness-printerOffset,0]) cube([contactPinLargeDiameter,1,topCaseThickness]);
    }
}



module buttonNegative(){
    cube([buttonDepth,buttonWidth,buttonHeight]);
    translate([0,-buttonSolderPadsWidth,0])cube([buttonDepth,buttonSolderPadsWidth,buttonSolderPadHeight]);
    translate([0,buttonWidth,0])cube([buttonDepth,buttonSolderPadsWidth,buttonSolderPadHeight]);
    translate([-klickerDistance-klickerArmThickness,-klickerLength+klickerMountWidth,0])cube([klickerDistance+klickerArmThickness,klickerLength+buttonWidth-klickerMountWidth+buttonSolderPadsWidth,topCaseThickness]);
}


module displayNegative(){
    cube([displayWidth,displayHeight,displayThickness]);
    translate([-displayCablePositonY,displayCableWidth,0])cube([displayCableWidth,displayCableHeight,displayThickness]);
    translate([displayBacklightPosX,displayBacklightPosY,displayThickness])cube([displayBacklightWidth,displayBacklightHeight,topCaseThickness-displayThickness]);
}

module klicker(){
    intersection(){
        union(){
            translate([-klickerDistance-klickerArmThickness,-klickerLength,0])cube([klickerArmThickness,klickerLength+buttonWidth,topCaseThickness]);
            intersection(){
                translate([-klickerDistance-klickerArmThickness-klickerCylinderMaxWidth,0,0])cube([klickerCylinderMaxWidth,buttonWidth,topCaseThickness]);

                translate([-klickerDistance-klickerArmThickness,buttonWidth/2,0])scale([klickerCylinderScaleFactor,1,1])cylinder(d=buttonWidth,h=topCaseThickness);
            }
        }
        translate([-klickerDistance,-klickerLength,0])rotate([0,0,klickerAngle])cube([30,30,topCaseThickness]);
    }
    translate([-klickerDistance,-klickerLength,0])cube([klickerDistance,klickerMountWidth,topCaseThickness]);
}

module screwNegative(desiredScrewHeadHeight){
    translate([0,0,desiredScrewHeadHeight-screwHeadHeight])cylinder(d1=screwHeadDiameter+printerOffset,d2=screwDiameter+printerOffset,h=screwHeadHeight);
    cylinder(d1=screwHeadDiameter+printerOffset,d2=screwHeadDiameter+printerOffset,h=desiredScrewHeadHeight-screwHeadHeight);
}
module screwNegativeRotated(desiredScrewHeadHeight){
    translate([0,0,desiredScrewHeadHeight])rotate([180,0,0])screwNegative(desiredScrewHeadHeight);
}



module sideCaseInnerEdgeNegative(){
    translate([-topPcbEdgeDiameter-printerOffset,-topPcbEdgeDiameter-printerOffset,0]) difference(){
        cube([topPcbEdgeDiameter+printerOffset*2,topPcbEdgeDiameter+printerOffset*2,sideCoverHeight]);
        cylinder(r=topPcbEdgeDiameter+printerOffset, h=sideCoverHeight);
    }
}

module sideCaseOuterEdgeNegative(){
    translate([-topPcbEdgeDiameter-printerOffset-sideCoverThickness,-topPcbEdgeDiameter-printerOffset-sideCoverThickness,0]) difference(){
        cube([topPcbEdgeDiameter+printerOffset*2+sideCoverThickness,topPcbEdgeDiameter+printerOffset*2+sideCoverThickness,sideCoverHeight]);
        cylinder(r=topPcbEdgeDiameter+printerOffset+sideCoverThickness, h=sideCoverHeight);
    }
}


module sideCoverInnerNegative(){
    translate([-printerOffset,-printerOffset,0])difference(){
        cube([topPcbWidth + printerOffset*2,topPcbHeight + printerOffset*2,sideCoverHeight]);
        
        //edge cutting
        //down 
        rotate([0,0,180])sideCaseInnerEdgeNegative();
        translate([topPcbWidth+printerOffset*3,topPcbHeight+printerOffset*3,0])rotate([0,0,0])sideCaseInnerEdgeNegative();
        translate([0,topPcbHeight+printerOffset*3,0])rotate([0,0,90])sideCaseInnerEdgeNegative();
        translate([topPcbWidth+printerOffset*3,0,0])rotate([0,0,-90])sideCaseInnerEdgeNegative();
    }
}

semiTransparentThickness = 0.6;
    semiTransparentHeight = 2;
    semiTransparentWidth = 2;
    ledDistanceToScrew = 4;

module sideCoverLedNegative(){
    
    translate([-printerOffset+ledDistanceToScrew-semiTransparentWidth/2+bottomScrewDistanceX,topPcbOffset-printerOffset-sideCoverThickness+semiTransparentThickness+0.001,-semiTransparentHeight+sideCoverHeight-topPcbThickness]){
        cube([semiTransparentWidth,sideCoverThickness-semiTransparentThickness,semiTransparentHeight]);
    }
    
    translate([topPcbWidth-semiTransparentWidth+printerOffset-ledDistanceToScrew+semiTransparentWidth/2-bottomScrewDistanceX,topPcbOffset-printerOffset-sideCoverThickness+semiTransparentThickness+0.001,-semiTransparentHeight+sideCoverHeight-topPcbThickness]){
        cube([semiTransparentWidth,sideCoverThickness-semiTransparentThickness,semiTransparentHeight]);
    }
    
    translate([-printerOffset+ledDistanceToScrew-semiTransparentWidth/2+bottomScrewDistanceX,topPcbOffset+printerOffset+topPcbHeight-0.001,-semiTransparentHeight+sideCoverHeight-topPcbThickness]){
        cube([semiTransparentWidth,sideCoverThickness-semiTransparentThickness,semiTransparentHeight]);
    }
    
    translate([topPcbWidth-semiTransparentWidth+printerOffset-ledDistanceToScrew+semiTransparentWidth/2-bottomScrewDistanceX,topPcbOffset+printerOffset+topPcbHeight-0.001,-semiTransparentHeight+sideCoverHeight-topPcbThickness]){
        cube([semiTransparentWidth,sideCoverThickness-semiTransparentThickness,semiTransparentHeight]);
    }
}

module sideCover(){
    difference(){
        sideCoverRaw(sideCoverHeight);
        
        translate([0,topPcbOffset,0]){
            //typeC
            typeCNegative();
            translate([0,0,-typeCHeight])typeCNegative();
        
            //bottomPlate 
            translate([-printerOffset-sideCoverThickness-0.5,-topPcbOffset-bottomEdgeDiameter,0])cube([bottomPcbWidth+printerOffset*2+sideCoverThickness*2+1,bottomEdgeDiameter*2,bottomPcbThickness]);
        
            translate([-printerOffset-sideCoverThickness-0.5,-topPcbOffset+
       bottomPcbHeight-bottomEdgeDiameter,0])cube([bottomPcbWidth+printerOffset*2+sideCoverThickness*2+1,bottomEdgeDiameter*2,bottomPcbThickness]);
        
            //contact pins
            translate([contactPinDistanceX,bottomPcbHeight-contactPinHeigth-0.5,bottomPcbThickness])cube([contactPinWidth,contactPinHeigth+0.5,caseThickness]);
        
            translate([contactPinDistanceX,-printerOffset-sideCoverThickness-0.5,bottomPcbThickness])cube([contactPinWidth,contactPinHeigth+0.5,caseThickness]);
        
            //spare for pcb interconnect overhangs
            translate([-printerOffset-pcbOverhangDepth,-topPcbOffset+pcbOverhangPosY,0])cube([bottomPcbWidth+printerOffset*2+pcbOverhangDepth*2,pcbOverhangThickness,bottomPcbThickness]);
        }
        sideCoverLedNegative();
    }
}

rocketLedHeight = 5.5;
rocketLedWidth = 3.5;
rocketLedWidthPercentage = rocketLedWidth/rocketLedHeight;
module cutoutsRocketLed(){
    scale([rocketLedWidthPercentage,1,1])cylinder(d=rocketLedHeight,h=topCaseThickness);
}



module typeCNegative(){
    translate([-sideCoverThickness-printerOffset-0.5,typeCPosY-topPcbOffset,bottomPcbThickness])cube([sideCoverThickness+1,typeCWidth,typeCHeight]);
}



module sideCoverRaw(height){
    translate([0,topPcbOffset,0])difference(){
        translate([-printerOffset-sideCoverThickness,-printerOffset-sideCoverThickness,0])difference(){
            cube([topPcbWidth + printerOffset*2+sideCoverThickness*2,topPcbHeight + printerOffset*2+sideCoverThickness*2,height]);
        
            //edge cutting
            rotate([0,0,180])sideCaseOuterEdgeNegative();
            translate([topPcbWidth+(printerOffset+sideCoverThickness)*2,topPcbHeight++(printerOffset+sideCoverThickness)*2,0])rotate([0,0,0])sideCaseOuterEdgeNegative();
            translate([0,topPcbHeight++(printerOffset+sideCoverThickness)*2,0])rotate([0,0,90])sideCaseOuterEdgeNegative();
            translate([topPcbWidth++(printerOffset+sideCoverThickness)*2,0,0])rotate([0,0,-90])sideCaseOuterEdgeNegative();
        }
        sideCoverInnerNegative();
    }
}



module pcbSpacerHex(){
    difference(){
        intersection(){
            cube([spacerThickness,spacerThickness*3,spacerHeight], center = true);
            rotate([0,0,120])cube([spacerThickness,spacerThickness*3,spacerHeight], center = true);
            rotate([0,0,-120])cube([spacerThickness,spacerThickness*3,spacerHeight], center = true);
        }
        translate([0,0,-spacerHeight/2-1])cylinder(d=spacerInnerDiameter,h=spacerHeight+2);
    }
}
