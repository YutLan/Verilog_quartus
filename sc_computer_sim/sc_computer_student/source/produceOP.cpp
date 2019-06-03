#include <iostream>
using namespace std;


void funcpro(int func[])
{
	//int func[6]={0,0,1,0,0,0};
	for (int i=0;i<6;i++)
	{ 
		if (func[i])
		  cout<<"func["<<5-i<<"]& ";
		else
		  cout<<"~func["<<5-i<<"]& ";
	}
	cout<<"r_type;";
}

void oppro(int op[])
{
	/*for (int i=0;i<6;++i)
    	cout<<op[i];*/
	//int func[6]={0,0,1,0,0,0};
	for (int i=0;i<5;i++)
	{ 
		if (op[i])
		  cout<<"op["<<5-i<<"]& ";
		else
		  cout<<"~op["<<5-i<<"]& ";
	}
    if (op[5])
		  cout<<"op["<<0<<"] ";
		else
		  cout<<"~op["<<0<<"] ";

	cout<<";";
}

int main()
{
  	int func[6]={0,0,0,0,1,1};

/*    for (int i=0;i<6;++i)
    	cin>>func[i];*/
    oppro(func);
  
}