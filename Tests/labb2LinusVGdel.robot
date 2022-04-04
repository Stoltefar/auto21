*** Settings ***
Documentation  Test case for VG-assignment in the course 'Automatiserad testning'
...  Testing car rental web page rental11.infotiv.net

Resource  ../Resources/keywords.robot

Library  SeleniumLibrary

Test Setup  Begin Web Test

Test Teardown  Delete Car Booking And Logout  # Will show Fail if user have previous bookings when running test.

Suite Teardown  End Web Test

*** Variables ***
${URL}  http://rental11.infotiv.net/
${BROWSER}  chrome

*** Test Cases ***
Book A Car As An Existing User
    [Documentation]  A test case testing the navigation flow when booking a car.
    [Tags]  VG_test

    Given User is logged in on Car Rental page
      And User chooses a valid date on Date Selection Page
      And User is on Car Selection Page

     When User clicks a button to book a Volvo V40
      And User submits valid credit card details on the Confirmation Page
      And User clicks "Confirm" button

     Then User gets confirmation of the booking
      And User can see the booked car on Users "My Page"



