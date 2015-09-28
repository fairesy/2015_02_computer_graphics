//
//  main.m
//  graphics_01
//
//  Created by shinyoung on 2015. 9. 29..
//  Copyright (c) 2015년 shinyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGL/OpenGL.h>
#import <GLUT/GLUT.h>

GLfloat xOne = 0.0f;
GLfloat yOne = 0.0f;
GLsizei rsize = 50.0f;

GLfloat xTwo = -20.0f;
GLfloat yTwo = -50.0f;

GLfloat xThree = 10.0f;
GLfloat yThree = 50.0f;

GLfloat xFour = -60.0f;
GLfloat yFour = 40.0f;

GLfloat xstep1 = 1.0f;
GLfloat ystep1 = 1.0f;

GLfloat xstep2 = 3.0f;
GLfloat ystep2 = 1.0f;

GLfloat xstep3 = 2.0f;
GLfloat ystep3 = 4.0f;

GLfloat xstep4 = 1.0f;
GLfloat ystep4 = 0.5f;

GLfloat window_width;
GLfloat window_height;


void RenderScene(void){
    glClear(GL_COLOR_BUFFER_BIT);
    
    //draw rectangle
    glColor3f(1.0f, 0.0f, 0.0f);
    glRectf(xOne, yOne, xOne+rsize, yOne+rsize);
    glColor3f(0.0f, 1.0f, 0.0f);
    glRectf(xTwo, yTwo, xTwo+rsize, yTwo+rsize);
    glColor3f(0.0f, 0.0f, 0.0f);
    glRectf(xThree, yThree, xThree+rsize, yThree+rsize);
    glColor3f(0.0f, 0.0f, 1.0f);
    glRectf(xFour, yFour, xFour+rsize, yFour+rsize);
    
    glutSwapBuffers();
}

void TimerFunction(int value){
    if(xOne > window_width - rsize || xOne < -window_width)
        xstep1 = -xstep1;
    if(yOne > window_height-rsize || yOne< -window_height)
        ystep1 = -ystep1;
    if(xOne > window_width-rsize)
        xOne = window_width-rsize-1;
    if(yOne > window_height-rsize)
        yOne = window_height-rsize-1;
    
    xOne += xstep1;
    yOne += ystep1;
    
    if(xTwo > window_width - rsize || xTwo < -window_width)
        xstep2 = -xstep2;
    if(yTwo > window_height-rsize || yTwo< -window_height)
        ystep2 = -ystep2;
    if(xTwo > window_width-rsize)
        xTwo = window_width-rsize-1;
    if(yTwo > window_height-rsize)
        yTwo = window_height-rsize-1;
    
    xTwo += xstep2;
    yTwo += ystep2;
    
    if(xThree > window_width - rsize || xThree < -window_width)
        xstep3 = -xstep3;
    if(yThree > window_height-rsize || yThree< -window_height)
        ystep3 = -ystep3;
    if(xThree > window_width-rsize)
        xThree = window_width-rsize-1;
    if(yThree > window_height-rsize)
        yThree = window_height-rsize-1;
    
    xThree += xstep3;
    yThree += ystep3;
    
    if(xFour > window_width - rsize || xFour < -window_width)
        xstep4 = -xstep4;
    if(yFour > window_height-rsize || yFour< -window_height)
        ystep4 = -ystep4;
    if(xFour > window_width-rsize)
        xFour = window_width-rsize-1;
    if(yFour > window_height-rsize)
        yFour = window_height-rsize-1;
    
    xFour += xstep4;
    yFour += ystep4;
    
    glutPostRedisplay();
    glutTimerFunc(33, TimerFunction, 1);
}

void SetupRC(void){
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
}

void ChangeSize(GLsizei w, GLsizei h){
    glViewport(0, 0, w, h);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    
    if(w<=h){
        window_width = 100.0f;
        window_height = 100.0f*h/w;
        glOrtho(-100.0f, 100.0f, -window_height, window_height, 1.0f, -1.0f);
    }else{
        window_width = 100.0f*w/h;
        window_height = 100.0f;
        glOrtho(-window_width, window_width, -100.0f, 100.0f, 1.0f, -1.0f);
    }
    
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}

int main(int argc, const char * argv[]) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);
    glutInitWindowSize(800, 600);
    glutCreateWindow("assignment01");
    glutDisplayFunc(RenderScene);
    glutReshapeFunc(ChangeSize);
    glutTimerFunc(1000, TimerFunction, 1);
    SetupRC();
    glutMainLoop();
    return 0;
}
