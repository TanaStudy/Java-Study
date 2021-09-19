import com.hou.service.UserServiceImp;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {

    public static void main(String[] args) {
        ApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("beans.xml");

        UserServiceImp userServiceImp = (UserServiceImp) classPathXmlApplicationContext.getBean("userServiceImpl");

        userServiceImp.getUser();

    }

}



