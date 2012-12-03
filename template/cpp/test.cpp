
Test* Test::m_ins = NULL;
auto_ptr<Test> Test::m_auto_ptr;
Test::Test()
{
	m_auto_ptr = auto_ptr<Test>(this);
}
Test::~Test()
{
}
Test* Test::Ins()
{
	if ( m_ins == NULL)
		m_ins = new Test();
	return m_ins;
}

