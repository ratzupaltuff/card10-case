$fa = 0.5;
$fs = 0.5;

//printer
printerOffset = 0.2;
caseThickness = 1.5;

//bottompcb
bottomPcbThickness = 1;
bottomPcbWidth = 45;
bottomPcbHeight = 38;

bottomEdgeDiameter = 4.5;

//toppcb
topPcbWidth = bottomPcbWidth;
topPcbHeight = 35.5;
topPcbEdgeDiameter = 2.75;
bottomPcbThickness = 1.8;

//contactPins
contactPinWidth = 33;
contactPinHeigth = 3;
contactPinDistanceX = 6;

//buttons
buttonHeight = 1.5;
buttonWidth = 3.8;
buttonDepth = 3.2;
buttonSolderPadsWidth = 1;
buttonSolderPadHeight = buttonHeight/2;

//buttonPositions
button1x = 0;
button1Y = 23.5;
button2x = 0;
button2Y = 7.8;
button3x = 42;
button3Y = 7;
button4x = 42;
button4Y = 13;

//display
displayHeight = 13.5;
displayWidth = 28;
displayThickness = 2;
displayCableHeight = 9;
displayCableWidth = 2;
displayPositionX = 10;
displayPositionY = 9.5;
displayCablePositonY = 2;


//screws
bottomScrewDistanceX = 3;
bottomScrewDistanceY = 4.5;
topScrewDistanceX = bottomScrewDistanceX;
topScrewDistanceY = 3.25;
ScrewDistanceX = 39;
ScrewDistanceY = 29;
screwHeadDiameter = 3.8;
screwHeadHeight = 1.5;
screwDiameter = 2;

//spacer
distancePcbs = 5;
topPcbOffset = bottomScrewDistanceY-topScrewDistanceY;

//IRsensor
sensorHeight = 3.5;
sensorWidth = 5.5;
sensorPosX = 23;
sensorPosY = 2.8;
sensorThickness = 1.5;

//frontLed
ledHeight = 3;
ledWidth = 3;
ledThickness = caseThickness;
ledPosX = 27.5;
ledPosY = 29.5;

//display elements
bottomPcbCover();
translate([0,topPcbOffset,distancePcbs+bottomPcbThickness+bottomPcbThickness])topCover();

//jumperSpare
jumperHeight = 2;
jumperWidth = 3;
jumperThickness = 1;
jumperPosX = 39;
jumperPosY = 18.5;


module bottomPcbCover(){
difference(){
    cube([bottomPcbWidth,bottomPcbHeight,caseThickness]);

    //screw cuttings
    translate([bottomScrewDistanceX,bottomScrewDistanceY,0])cylinder(,d1=screwHeadDiameter+printerOffset,d2=screwDiameter+printerOffset,h=screwHeadHeight);


    translate([bottomScrewDistanceX+ScrewDistanceX,bottomScrewDistanceY,0])cylinder(,d1=screwHeadDiameter+printerOffset,d2=screwDiameter+printerOffset,h=screwHeadHeight);


    translate([bottomScrewDistanceX,bottomScrewDistanceY+ScrewDistanceY,0])cylinder(,d1=screwHeadDiameter+printerOffset,d2=screwDiameter+printerOffset,h=screwHeadHeight);


    translate([bottomScrewDistanceX+ScrewDistanceX,bottomScrewDistanceY+ScrewDistanceY,0])cylinder(,d1=screwHeadDiameter+printerOffset,d2=screwDiameter+printerOffset,h=screwHeadHeight);
    
    //contactPinCuttings
    translate([contactPinDistanceX,0,0])cube([contactPinWidth,contactPinHeigth,caseThickness]);
    
    translate([contactPinDistanceX,bottomPcbHeight-contactPinHeigth,0])cube([contactPinWidth,contactPinHeigth,caseThickness]);
    
    //edge cutting
    rotate([0,0,180])bottomEdgeNegative();
    translate([bottomPcbWidth,bottomPcbHeight,0])rotate([0,0,0])bottomEdgeNegative();
    translate([0,bottomPcbHeight,0])rotate([0,0,90])bottomEdgeNegative();
    translate([bottomPcbWidth,0,0])rotate([0,0,-90])bottomEdgeNegative();
}
}

module bottomEdgeNegative(){
    translate([-bottomEdgeDiameter,-bottomEdgeDiameter,0]) difference(){
        cube([bottomEdgeDiameter,bottomEdgeDiameter,caseThickness]);
        cylinder(r=bottomEdgeDiameter, h=caseThickness);
    }
}

module topEdgeNegative(){
    translate([-topPcbEdgeDiameter,-topPcbEdgeDiameter,0]) difference(){
        cube([topPcbEdgeDiameter,topPcbEdgeDiameter,caseThickness]);
        cylinder(r=topPcbEdgeDiameter, h=caseThickness);
    }
}

module topCover(){
difference(){
    cube([topPcbWidth,topPcbHeight,caseThickness]);

    //screw cuttings
    translate([topScrewDistanceX,topScrewDistanceY,0])cylinder(,d2=screwHeadDiameter+printerOffset,d1=screwDiameter+printerOffset,h=screwHeadHeight);


    translate([topScrewDistanceX+ScrewDistanceX,topScrewDistanceY,0])cylinder(,d2=screwHeadDiameter+printerOffset,d1=screwDiameter+printerOffset,h=screwHeadHeight);


    translate([topScrewDistanceX,topScrewDistanceY+ScrewDistanceY,0])cylinder(,d2=screwHeadDiameter+printerOffset,d1=screwDiameter+printerOffset,h=screwHeadHeight);


    translate([topScrewDistanceX+ScrewDistanceX,topScrewDistanceY+ScrewDistanceY,0])cylinder(,d2=screwHeadDiameter+printerOffset,d1=screwDiameter+printerOffset,h=screwHeadHeight);
    
    
    translate([button1x,button1Y,0]) buttonNegative();
    translate([button2x,button2Y,0]) buttonNegative();
    translate([button3x,button3Y,0]) buttonNegative();
    translate([button4x,button4Y,0]) buttonNegative();
    
    translate([displayPositionX,displayPositionY,0])displayNegative();
    
    //edge cutting
    rotate([0,0,180])topEdgeNegative();
    translate([topPcbWidth,topPcbHeight,0])rotate([0,0,0])topEdgeNegative();
    translate([0,topPcbHeight,0])rotate([0,0,90])topEdgeNegative();
    translate([topPcbWidth,0,0])rotate([0,0,-90])topEdgeNegative();
    
    //sensor cutting
    translate([sensorPosX,sensorPosY,0])cube([sensorWidth,sensorHeight,sensorThickness]);

    translate([jumperPosX,jumperPosY,0])cube([jumperWidth,jumperHeight,jumperThickness]);
    
    translate([ledPosX,ledPosY,0])cube([ledHeight,ledHeight,ledThickness]);
    
}



module buttonNegative(){
    cube([buttonDepth,buttonWidth,buttonHeight]);
    translate([0,-buttonSolderPadsWidth,0])cube([buttonDepth,buttonSolderPadsWidth,buttonSolderPadHeight]);
    translate([0,buttonWidth,0])cube([buttonDepth,buttonSolderPadsWidth,buttonSolderPadHeight]);
    
}
}

module displayNegative(){
    cube([displayWidth,displayHeight,displayThickness]);
    translate([-displayCablePositonY,displayCableWidth,0])cube([displayCableWidth,displayCableHeight,displayThickness]);
}




