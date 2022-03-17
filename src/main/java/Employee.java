public class Employee {

    private String name;
    private int age;
    private int id;
    private static int idCounter = 0;
    private double salary;


    public Employee(String name, int age, double salary) {
        this.name = name;
        this.age = age;
        this.id = idCounter + 1;
        this.salary = salary;
        ++idCounter;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getAge() {
        return age;
    }

    public int getId() {
        return id;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Name: " + name + ", Age: " + age + ", Salary: " + salary + ", ID: " + id;
    }

    public void raiseSalary(double raisePercentage) {
        if (raisePercentage >= 0 && raisePercentage <= 100) {
            this.salary = salary * (1 + (raisePercentage / 100));
        }
    }
}
