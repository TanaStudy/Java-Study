import com.pojo.Student;
import com.pojo.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Mytest {

    public static void main(String[] args) {
        ApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("beans.xml");
        Student student = (Student) classPathXmlApplicationContext.getBean("student");
        System.out.println(student.toString());

    }

    @Test
    public void test2(){
        ApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("user.xml");
        User user = (User) classPathXmlApplicationContext.getBean("use2");
        System.out.println(user);

    }

}
