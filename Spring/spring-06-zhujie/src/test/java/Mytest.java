
import com.pojo.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Mytest {

    @Test
    public void test(){
        ApplicationContext context=new ClassPathXmlApplicationContext("Applicationcontext.xml");
        User user = context.getBean("user", User.class);
        System.out.println(user.getName());
    }

}
