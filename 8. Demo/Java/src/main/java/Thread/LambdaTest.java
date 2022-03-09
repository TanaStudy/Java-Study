package Thread;

public class LambdaTest {
    public static void main(String[] args) {
        for(int i = 0; i < 10; i++){
            // 普通方式
            new Thread(new Runnable() {
                @Override
                public void run() {
                    System.out.println(Thread.currentThread().getName() + " 运行了...");
                }
            }).start();
        }
        // 普通方式
        new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println(Thread.currentThread().getName() + " 运行了...");
            }
        },"线程 A").start();
        // Lambda 写法
        new Thread(()->{
            System.out.println(Thread.currentThread().getName() + " 运行了...");
        },"线程 B").start();
    }
}
