//
//  main.m
//  graphics_02
//
//  Created by shinyoung on 2015. 9. 28..
//  Copyright (c) 2015년 shinyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGL/OpenGL.h>
#import <GLUT/GLUT.h>
#import <math.h>

#define GL_PI 3.1415f
static GLfloat xRot = 0.0f;
static GLfloat yRot = 0.0f;
void SetupRC()
{
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
    glEnable(GL_DEPTH_TEST);
    glFrontFace(GL_CCW);
    glEnable(GL_CULL_FACE);
}
void TimerFunc(int value)
{
    glutPostRedisplay();
    glutTimerFunc(100, TimerFunc, 1);
}

void ChangeSize(int w, int h)
{
    GLfloat fAspect;
    glViewport(0, 0, w, h);
    fAspect = (GLfloat)w/(GLfloat)h;
    
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(60.0f, fAspect, 10.0f, 500.0f);
    
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    
    glTranslatef(0.0f, 0.0f, -200.0f);
}

void RenderScene(){
    static GLfloat fElect1 = 0.0f;
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glTranslatef(0.0f, 0.0f, -100.0f);
    glColor3ub(255, 0,0);
    glutSolidSphere(10.0f,15,15);
    
    glPushMatrix();
        glRotatef(fElect1, 0.0f,1.0f,0.0f);
        glTranslatef(90.0f,0.0f,0.0f);
        glColor3ub(255,255,0);
        glutSolidSphere(6.0f,15,15);
    glPopMatrix();
    
    glPushMatrix();
        glRotatef(fElect1, 0.0f,1.0f,0.0f);
        glTranslatef(-70.0f, 0.0f,0.0f);
        glutSolidSphere(6.0f,15,15);
    glPopMatrix();
    
    glPushMatrix();
        glRotatef(fElect1, 0.0f, 1.0f, 0.0f);
        glTranslatef(0.0f, 0.0f, 60.0f);
        glutSolidSphere(6.0f, 15, 15);
    glPopMatrix();
    
    fElect1 += 10.0f;
    if(fElect1 > 360.0f)
        fElect1 = 0.0f;
    glutSwapBuffers();
}

void ControlKey(int key, int x, int y){
    if(key == GLUT_KEY_UP)
        xRot -=5.0f;
    if(key == GLUT_KEY_DOWN)
        xRot +=5.0f;
    if(key == GLUT_KEY_LEFT)
        yRot -=5.0f;
    if(key == GLUT_KEY_RIGHT)
        yRot +=5.0f;
    glutPostRedisplay();
}


int main(int argc, const char * argv[]) {
    glutInit(&argc, argv);
    
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize(800,800);
    glutInitWindowPosition(0,0);
    glutCreateWindow("Atom");
    glutReshapeFunc(ChangeSize);
    glutTimerFunc(33,TimerFunc,1);
    glutSpecialFunc(ControlKey);
    glutDisplayFunc(RenderScene);
    SetupRC();
    glutMainLoop();
    
    return 0;
}
