import com.hou.pojo.User;
import com.hou.pojo.UsetT;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Mytest {

    public static void main(String[] args) {
        ApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("beans.xml");
        UsetT user =(UsetT) classPathXmlApplicationContext.getBean("u2");
        System.out.println(user.toString());

    }
}
