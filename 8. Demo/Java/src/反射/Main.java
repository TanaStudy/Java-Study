package 反射;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class Main {
    public static void main(String[] args) throws ClassNotFoundException, IllegalAccessException, InstantiationException, NoSuchMethodException, InvocationTargetException, NoSuchFieldException {
        TargetObject targetObject = new TargetObject();
        Class c1 = TargetObject.class;
        Class c2 = targetObject.getClass();
        Class c3 = Class.forName("反射.TargetObject");

        System.out.println(c1.getName());
        System.out.println(c2.getName());
        System.out.println(c3.getName());

        TargetObject targetObject1 = (TargetObject) c1.newInstance();

        Method[] methods = c1.getDeclaredMethods();
        for (Method method : methods) {
            System.out.println(method.getName());
            Class m1 = method.getReturnType();
            System.out.println(m1.getName());
            Class[] m2 = method.getParameterTypes();
            for(Class m : m2){
                System.out.println(m.getName());
            }



        }

        Method publicMethod = c1.getDeclaredMethod("publicMethod",String.class);
        publicMethod.invoke(targetObject, "JavaGuide");

        Field field = c1.getDeclaredField("value");
        field.setAccessible(true);
        field.set(targetObject, "Tanzhihan");

        Method privateMethod = c1.getDeclaredMethod("privateMethod");
        //为了调用private方法我们取消安全检查
        privateMethod.setAccessible(true);
        privateMethod.invoke(targetObject);

    }
}
