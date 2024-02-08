package db;
import java.util.ArrayList;
import java.util.Objects;

public class DBManager {
    private static final ArrayList<Tasks> tasks = new ArrayList<>();
    private static long id = 6L;

    static {
        tasks.add(new Tasks(1L,
                "Создать веб приложение на Джава ЕЕ",
                "Создать веб приложение на Джава ЕЕ",
                "23.10.2023", true));
        tasks.add(new Tasks(2L,
                "Убраться дома и закупить продукты",
                "Создать веб приложение на Джава ЕЕ",
                "24.10.2023", true));
        tasks.add(new Tasks(3L,
                "Выполнить все домашние задания",
                "Создать веб приложение на Джава ЕЕ",
                "25.10.2023", true));
        tasks.add(new Tasks(4L,
                "Записаться на качку",
                "Создать веб приложение на Джава ЕЕ",
                "26.10.2023", false));
        tasks.add(new Tasks(5L,
                "Учить Итальянский",
                "Создать веб приложение на Джава ЕЕ",
                "27.10.2023", false));

    }

    public static ArrayList<Tasks> getAllTasks(){
        return tasks;
    }

    public static void addTask(Tasks task){
        task.setId(id);
        tasks.add(task);
        id++;
    }

    public static Tasks getTask(Long id){
        return tasks.stream()
                .filter(task -> Objects.equals(task.getId(), id))
                .findFirst()
                .orElse(null);
    }

    public static void updateTask(Tasks updatedTask){
        for (int i = 0; i < tasks.size(); i++) {
            if(Objects.equals(tasks.get(i).getId(), updatedTask.getId())){
                tasks.set(i, updatedTask);
                break;
            }
        }
    }

    public static void deleteTask(long id){
        for (int i = 0; i < tasks.size(); i++) {
            if(tasks.get(i).getId() == id) {
                tasks.remove(tasks.get(i));
                System.out.println("Success");
                break;
            }
        }
    }
}
