package 单例模式;


public class Singleton {
    private static volatile Singleton singleton;

    private Singleton(){
    }

    public  static Singleton getInstance(){
        if(singleton == null){
            synchronized (Singleton.class){
                if(singleton == null){
                    singleton = new Singleton();
                }
            }
        }
        return singleton;
    }

    public static void main(String[] args) {
        for(int i = 0; i < 100; i++){
            new Thread(new Runnable() {
                @Override
                public void run() {
                    System.out.println(Thread.currentThread().getName() + " " + Singleton.getInstance().hashCode());
                }
            }).start();
        }
    }
}
