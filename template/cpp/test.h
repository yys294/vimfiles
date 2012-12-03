#include <iostream>
#include <string>
#include <vector>
#include <map>
using namespace std;
class Test
{
	private:
		static auto_ptr<Test> m_auto_ptr;
		static Test * m_ins;
	public:
		static Test * Ins();
	protected:
		Test();
		Test(const Test&);
		virtual ~Test();
		friend class auto_ptr<Test>; 
};

