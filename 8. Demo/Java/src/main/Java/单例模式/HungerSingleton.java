package 单例模式;

public class HungerSingleton {
    private static HungerSingleton instance = new HungerSingleton();

    private HungerSingleton(){}

    public static HungerSingleton getInstance(){
        return instance;
    }
}
