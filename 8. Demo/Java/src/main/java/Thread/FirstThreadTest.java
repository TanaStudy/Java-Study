package Thread;

public class FirstThreadTest extends Thread{
    int i = 0;
    public void run(){
        for(; i < 100; i++){
            System.out.println(getName() + "  " + i);
        }
    }

    public static void main(String[] args) {
        for(int i = 0; i < 100; i++){
            System.out.println(Thread.currentThread().getName() + "  " + i);
            if(i == 20){
                new FirstThreadTest().start();
                new FirstThreadTest().start();
            }
        }
    }
}
