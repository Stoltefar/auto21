import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class EmployeeTest {

    Employee employeeObject;

    @BeforeEach
    public void setUpEmployee() {
        employeeObject = new Employee("StartName", 42, 3.14);
    }

    @Test
    @Order(1)
    public void checkIdVariable() {
        int actual = employeeObject.getId();
        int expected = 1;

        assertEquals(expected, actual);
    }

    @Test
    @Order(2)
    public void checkAutoIncrementOnId() {
        int expected = 2;
        int actual = employeeObject.getId();

        assertEquals(expected, actual);
    }
    @Test
    public void createEmployee() {
        //employeeObject = new Employee(); Removed when creating constructor.
        assertInstanceOf(Employee.class, employeeObject);
    }

    @Test
    public void checkNameVariable() {
        //Arrange
        String expected = "Adam";

        // Act
        employeeObject.setName("Adam");
        String actual = employeeObject.getName();

        // Assert
        assertEquals(expected, actual);
    }

    @Test
    public void checkAgeVariable() {
        //Arrange
        int expected = 42;

        //Act
        employeeObject.setAge(42);
        int actual = employeeObject.getAge();

        //Assert
        assertEquals(expected, actual);
    }

    @Test
    public void checkSalaryVariable() {
        double expected = 3.14;
        double actual = employeeObject.getSalary();

        assertEquals(expected, actual);
    }

    @Test
    public void checkSetSalary() {
        // Arrange
        employeeObject.setSalary(1.41);
        double expected = 1.41;

        // Act
        double actual = employeeObject.getSalary();

        //Assert
        assertEquals(expected, actual);
    }
}