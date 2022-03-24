package 单例模式;

public class LazySingleton {
    private static LazySingleton instance = null;

    private LazySingleton(){
        System.out.println("初始化LazySingleton..........");
    }

    public static LazySingleton getInstance(){
        if(instance == null){
            instance = new LazySingleton();
        }
        return instance;
    }
}
