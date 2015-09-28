#include <gl/glut.h>
#include <windows.h>
#include <math.h>

static GLfloat xRot = -10.0f;
static GLfloat yRot = 15.0f;

void SetupRC() {
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
	glEnable(GL_CULL_FACE);
	glFrontFace(GL_CW);
}

void ChangeSize(int w, int h) {
	GLfloat nRange = 100.0f;

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glViewport(0, 0, w, h);

	if (w <= h)
		glOrtho(-nRange, nRange, -nRange*h / w, nRange*h / w, -nRange, nRange);
	else
		glOrtho(-nRange*w/h, nRange*w/h, -nRange, nRange, -nRange, nRange);

	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
}

void RenderScene() {
	glRotatef(45, xRot, yRot, 0.0f);
	glClear(GL_COLOR_BUFFER_BIT);
	glShadeModel(GL_SMOOTH);

	glBegin(GL_QUADS);
	//�Ʒ� : ����-����-��ȫ-û��
	glColor3ub((GLubyte)0, (GLubyte)0, (GLubyte)0);
	glVertex3f(0.0f, 0.0f, 0.0f);
	glColor3ub((GLubyte)255, (GLubyte)0, (GLubyte)0);
	glVertex3f(50.0f, 0.0f, 0.0f);
	glColor3ub((GLubyte)255, (GLubyte)0, (GLubyte)255);
	glVertex3f(50.0f, 0.0f, -50.0f);
	glColor3ub((GLubyte)0, (GLubyte)0, (GLubyte)255);
	glVertex3f(0.0f, 0.0f, -50.0f);

	//�� : ���-���-����-����
	glColor3ub((GLubyte)0, (GLubyte)255, (GLubyte)0);
	glVertex3f(0.0f, 50.0f, 0.0f);
	glColor3ub((GLubyte)255, (GLubyte)255, (GLubyte)0);
	glVertex3f(50.0f, 50.0f, 0.0f);
	glColor3ub((GLubyte)255, (GLubyte)0, (GLubyte)0);
	glVertex3f(50.0f, 0.0f, 0.0f);
	glColor3ub((GLubyte)0, (GLubyte)0, (GLubyte)0);
	glVertex3f(0.0f, 0.0f, 0.0f);

	//���� : ���-����-û��-û��
	glColor3ub((GLubyte)0, (GLubyte)255, (GLubyte)0);
	glVertex3f(0.0f, 50.0f, 0.0f);
	glColor3ub((GLubyte)0, (GLubyte)0, (GLubyte)0);
	glVertex3f(0.0f, 0.0f, 0.0f);
	glColor3ub((GLubyte)0, (GLubyte)0, (GLubyte)255);
	glVertex3f(0.0f, 0.0f, -50.0f);
	glColor3ub((GLubyte)0, (GLubyte)255, (GLubyte)255);
	glVertex3f(0.0f, 50.0f, -50.0f);

	//������ : ���-����-��ȫ-��
	glColor3ub((GLubyte)255, (GLubyte)255, (GLubyte)0);
	glVertex3f(50.0f, 50.0f, 0.0f);
	glColor3ub((GLubyte)255, (GLubyte)0, (GLubyte)0);
	glVertex3f(50.0f, 0.0f, 0.0f);
	glColor3ub((GLubyte)255, (GLubyte)0, (GLubyte)255);
	glVertex3f(50.0f, 0.0f, -50.0f);
	glColor3ub((GLubyte)255, (GLubyte)255, (GLubyte)255);
	glVertex3f(50.0f, 50.0f, -50.0f);

	//�� : ���-���-���-û��
	glColor3ub((GLubyte)0, (GLubyte)255, (GLubyte)0);
	glVertex3f(0.0f, 50.0f, 0.0f);
	glColor3ub((GLubyte)255, (GLubyte)255, (GLubyte)0);
	glVertex3f(50.0f, 50.0f, 0.0f);
	glColor3ub((GLubyte)255, (GLubyte)255, (GLubyte)255);
	glVertex3f(50.0f, 50.0f, -50.0f);
	glColor3ub((GLubyte)0, (GLubyte)255, (GLubyte)255);
	glVertex3f(0.0f, 50.0f, -50.0f);

	//�� : û��-��-��ȫ-û�� 
	glColor3ub((GLubyte)0, (GLubyte)255, (GLubyte)255);
	glVertex3f(0.0f, 50.0f, -50.0f);
	glColor3ub((GLubyte)255, (GLubyte)255, (GLubyte)255);
	glVertex3f(50.0f, 50.0f, -50.0f);
	glColor3ub((GLubyte)255, (GLubyte)0, (GLubyte)255);
	glVertex3f(50.0f, 0.0f, -50.0f);
	glColor3ub((GLubyte)0, (GLubyte)0, (GLubyte)255);
	glVertex3f(0.0f, 0.0f, -50.0f);

	glEnd();

	glutSwapBuffers();
}

void main(void) {
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowPosition(0,0);
	glutInitWindowSize(512,512);
	glutCreateWindow("color cube");
	glutReshapeFunc(ChangeSize);
	glutDisplayFunc(RenderScene);
	SetupRC();
	glutMainLoop();
}