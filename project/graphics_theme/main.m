//
//  main.m
//  graphics_theme
//
//  Created by shinyoung on 2015. 9. 29..
//  Copyright (c) 2015년 shinyoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGL/OpenGL.h>
#import <GLUT/glut.h>
#import <math.h>

#define GL_PI 3.1415f

GLfloat nashiBodyX = 0.0f;
GLfloat nashiBodyY = 0.0f;

GLfloat nashiBodyWidth = 10.0f;
GLfloat nashiBodyHeight = 20.0f;

GLfloat nashiHeadX;
GLfloat nashiHeadY;

GLfloat window_width;
GLfloat window_height;

GLfloat angle;


void RenderScene(void){
    glClear(GL_COLOR_BUFFER_BIT);

    nashiHeadX = nashiHeadX;
    nashiHeadY = nashiBodyY+nashiBodyHeight;
    
    glColor3f(0.0f, 0.0f, 0.0f);
    glRectf(nashiBodyX, nashiBodyY, nashiBodyX+nashiBodyWidth, nashiBodyY+nashiBodyHeight);
    glPushMatrix();
    //glRotatef(-90, 0.0f, 0.0f, 1.0f);
    //glTranslatef(-nashiBodyWidth*2.5f, -nashiBodyHeight*0.75f, 0.0f);
    glBegin(GL_TRIANGLE_FAN);
        glColor3f(0.0f, 0.0f, 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2), nashiHeadY, 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(0.0f), nashiHeadY+(nashiBodyWidth/2)*cos(0.0f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(0.3f), nashiHeadY+(nashiBodyWidth/2)*cos(0.3f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(0.6f), nashiHeadY+(nashiBodyWidth/2)*cos(0.6f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(0.9f), nashiHeadY+(nashiBodyWidth/2)*cos(0.9f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(1.2f), nashiHeadY+(nashiBodyWidth/2)*cos(1.2f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(1.5f), nashiHeadY+(nashiBodyWidth/2)*cos(1.5f), 0.0f);
    
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(1.8f), nashiHeadY+(nashiBodyWidth/2)*cos(1.8f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(2.1f), nashiHeadY+(nashiBodyWidth/2)*cos(2.1f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(2.4f), nashiHeadY+(nashiBodyWidth/2)*cos(2.4f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(2.7f), nashiHeadY+(nashiBodyWidth/2)*cos(2.7f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(3.0f), nashiHeadY+(nashiBodyWidth/2)*cos(3.0f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(3.3f), nashiHeadY+(nashiBodyWidth/2)*cos(3.3f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(3.6f), nashiHeadY+(nashiBodyWidth/2)*cos(3.6f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(3.9f), nashiHeadY+(nashiBodyWidth/2)*cos(3.9f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(4.2f), nashiHeadY+(nashiBodyWidth/2)*cos(4.2f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(4.5f), nashiHeadY+(nashiBodyWidth/2)*cos(4.5f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(4.8f), nashiHeadY+(nashiBodyWidth/2)*cos(4.8f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(5.1f), nashiHeadY+(nashiBodyWidth/2)*cos(5.1f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(5.4f), nashiHeadY+(nashiBodyWidth/2)*cos(5.4f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(5.7f), nashiHeadY+(nashiBodyWidth/2)*cos(5.7f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(6.0f), nashiHeadY+(nashiBodyWidth/2)*cos(6.0f), 0.0f);
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)-(nashiBodyWidth/2)*sin(6.3f), nashiHeadY+(nashiBodyWidth/2)*cos(6.3f), 0.0f);
    glEnd();
    glPopMatrix();

    glBegin(GL_POLYGON);
    glColor3f(1.0f, 1.0f, 1.0f);
    for(angle = 0.0f; angle < 2 * GL_PI; angle += GL_PI / 12.0f)
        glVertex3f(nashiHeadX+(nashiBodyWidth/2)+cos(angle) * (nashiBodyWidth*0.4), nashiHeadY+sin(angle) * (nashiBodyWidth*0.4), 0.0f);
    glEnd();
    
    glColor3f(0.0f, 0.0f, 0.0f);
    glRectf(nashiHeadX+3.0f, nashiHeadY-3.0f, nashiHeadX+7.0f, nashiHeadY-1.5f);
    
    glColor3f(0.0f, 0.0f, 0.0f);
    //glRectf(nashiBodyX, nashiBodyY, nashiBodyX+nashiBodyWidth, nashiBodyY+nashiBodyHeight);
    
    
    glutSwapBuffers();
}

void SetupRC(void){
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
    glFrontFace(GL_CCW);
    glEnable(GL_CULL_FACE);
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
void ControlKey(int key, int x, int y){
    if(key == GLUT_KEY_UP){
        nashiBodyY+=5.0f;
        nashiHeadY+=5.0f;
    }
    if(key == GLUT_KEY_DOWN){
        nashiBodyY-=5.0f;
        nashiHeadY-=5.0f;
    }
    if(key == GLUT_KEY_LEFT){
        nashiBodyX-=5.0f;
        nashiHeadX-=5.0f;
    }
    if(key == GLUT_KEY_RIGHT){
        nashiBodyX+=5.0f;
        nashiHeadX+=5.0f;
    }
    
    glutPostRedisplay();
}

int main(int argc, const char * argv[]) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);
    glutInitWindowSize(800, 600);
    glutCreateWindow("personal_assignment");
    glutSpecialFunc(ControlKey);
    glutDisplayFunc(RenderScene);
    glutReshapeFunc(ChangeSize);
    SetupRC();
    glutMainLoop();
    return 0;
}
