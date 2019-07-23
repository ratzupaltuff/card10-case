//$fa = 0.5;
$fs = 0.5;

//printer
printerOffset = 0.2;
caseThickness = 1.5;

//bottompcb
bottomPcbThickness = 1;
bottomPcbWidth = 45.2;
bottomPcbHeight = 38.2;

bottomEdgeDiameter = 4.5;

//topPcb
topCaseThickness = 2;
topPcbWidth = bottomPcbWidth;
topPcbHeight = 35.7;
topPcbEdgeDiameter = 2.75;
topPcbThickness = 1.8;

//contactPins
contactPinWidth = 33;
contactPinHeigth = 3;
contactPinDistanceX = 6;

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

//display
displayHeight = 13.5+printerOffset*2;
displayWidth = 28+printerOffset*2;
displayThickness = 1.85;
displayCableHeight = 9+printerOffset;
displayCableWidth = 2+printerOffset;
displayPositionX = 10-printerOffset;
displayPositionY = 12-printerOffset;
displayCablePositonY = 2-printerOffset/2;

displayBacklightHeight = 11.5;
displayBacklightWidth = 22.5;
displayBacklightPosX = 4;
displayBacklightPosY = 1;


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

//Fingerprint sensor
sensorHeight = 3.5 + printerOffset;
sensorWidth = 5.5 + printerOffset;
sensorPosX = 23.2 - printerOffset/2; //23
sensorPosY = 2.6 -printerOffset/2; //2.8
sensorThickness = topCaseThickness; //1.5

//frontLed/ir sensor
ledHeight = 3;
ledWidth = 3;
ledThickness = topCaseThickness; //-0.15
ledPosX = 27.5;
ledPosY = 29.5;

//jumperSpare
jumperHeight = 2+printerOffset;
jumperWidth = 3+printerOffset;
jumperThickness = 1;
jumperPosX = 39-printerOffset/2;
jumperPosY = 18.3-printerOffset/2;

//klicker
klickerDistance = 1;
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


//choose which elements to display
bottomPcbCover();
translate([0,0,distancePcbs+bottomPcbThickness+topPcbThickness+caseThickness])topCover();
//topCover();
translate([0,0,caseThickness+printerOffset/2])sideCover();
//sideCover();

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
    
                //sensor cutting
                translate([sensorPosX,sensorPosY,0])cube([sensorWidth,sensorHeight,sensorThickness]);

                translate([jumperPosX,jumperPosY,0])cube([jumperWidth,jumperHeight,jumperThickness]);
    
                translate([ledPosX,ledPosY,0])cube([ledHeight,ledHeight,ledThickness]);
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
        cube([topPcbWidth + printerOffset,topPcbHeight + printerOffset,sideCoverHeight]);
        
        //edge cutting
        rotate([0,0,180])sideCaseInnerEdgeNegative();
        translate([topPcbWidth+printerOffset*2,topPcbHeight+printerOffset*2,0])rotate([0,0,0])sideCaseInnerEdgeNegative();
        translate([0,topPcbHeight+printerOffset*2,0])rotate([0,0,90])sideCaseInnerEdgeNegative();
        translate([topPcbWidth+printerOffset*2,0,0])rotate([0,0,-90])sideCaseInnerEdgeNegative();
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
    }
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