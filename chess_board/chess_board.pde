int totalWidth = 500;
int totalHeight = 500;
int boxColor1 = 255;
int boxColor2 = 0;
int r = 105;
int g = 45;
int b = 45;
int[] coordinateX1 = new int[64];
int[] coordinateX2 = new int[64];
int[] coordinateY1 = new int[64];
int[] coordinateY2 = new int[64];
int[] boxColor = new int[64];
int squareNumber = 0;
int cornerPercentage = 10;
int totalSquare = 8; //AxA

void settings() {
    size(totalWidth + totalWidth / cornerPercentage, totalHeight + totalHeight /
        cornerPercentage);
}

void setup() {
    for(int column = 0; column < totalSquare; column++) {
        for(int row = 0; row < totalSquare; row++) {
            if((row + column) % 2 == 0) {
                boxColor[squareNumber] = boxColor1;
            } else {
                boxColor[squareNumber] = boxColor2;
            }
            square(((totalWidth / totalSquare) * row) + totalWidth / (cornerPercentage * 2),
                ((totalHeight / totalSquare) * column) + totalHeight / (cornerPercentage * 2),
                ((totalWidth + totalHeight) / 2) / totalSquare);
            coordinateX1[squareNumber] = ((totalWidth / totalSquare) * row) + totalWidth /
                (cornerPercentage * 2);
            coordinateY1[squareNumber] = ((totalHeight / totalSquare) * column) + totalHeight /
                (cornerPercentage * 2);
            coordinateX2[squareNumber] = (((totalWidth / totalSquare) * row) + totalWidth /
                (cornerPercentage * 2)) + (((totalWidth + totalHeight) / 2) / totalSquare);
            coordinateY2[squareNumber] = (((totalHeight / totalSquare) * column) + totalHeight /
                (cornerPercentage * 2)) + (((totalWidth + totalHeight) / 2) / totalSquare);
            squareNumber++;
        }
    }
}

void draw() {
    background(r, g, b);

    for(int column = 0; column < totalSquare; column++) {
        for(int row = 0; row < totalSquare; row++) {
            if((row + column) % 2 == 0) {
                fill(boxColor1);
            } else {
                fill(boxColor2);
            }
            square(((totalWidth / totalSquare) * row) + totalWidth / (cornerPercentage * 2),
                ((totalHeight / totalSquare) * column) + totalHeight / (cornerPercentage * 2),
                ((totalWidth + totalHeight) / 2) / totalSquare);
        }
    }

    for(int squareNumber = 0; squareNumber < 64; squareNumber++) {
        if(mouseX > coordinateX1[squareNumber] && mouseX < coordinateX2[squareNumber] &&
            mouseY > coordinateY1[squareNumber] && mouseY < coordinateY2[squareNumber]) {
            if(boxColor[squareNumber] == boxColor1) {
                fill(boxColor2);
            } else {
                fill(boxColor1);
            }
            square(coordinateX1[squareNumber], coordinateY1[squareNumber], ((totalWidth +
                totalHeight) / 2) / totalSquare);
        } else {
            fill(boxColor[squareNumber]);
            square(coordinateX1[squareNumber], coordinateY1[squareNumber], ((totalWidth +
                totalHeight) / 2) / totalSquare);
        }
    }
}
