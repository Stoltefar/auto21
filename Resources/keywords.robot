*** Keywords ***
Begin Web Test
    Open Browser  about:blank  headlesschrome
    Maximize Browser Window

End Web Test
    Close Browser

Navigate To Infotiv Car Rental Web Page
    Go To  ${URL}
    Wait Until Page Contains  When do you want to make your trip?

Compare Date Value On Page With Current Date
    ${yyyy}  ${mm}  ${dd}=  Get time  year,month,day
    ${dateshown}=  Get Value  id:start
    Should be Equal  ${dateshown}  ${yyyy}-${mm}-${dd}

Choose current date and continue to Car Selection Page
    Click Element  id:continue
    Wait Until Page Contains  What would you like to drive?

Filter Make Volvo
    Click Element  id:filterMakeHolder
    Click Element  id:ms-opt-4

Filter Two Passengers
    Click Element  id:filterPassHolder
    Click Element  id:ms-opt-5

Filter Five Passengers
    Click Element  id:filterPassHolder
    Click Element  id:ms-opt-6

Book First Car In Filtered List
    Wait Until Page Contains Element  id:carSelect1
    Click Element  id:carSelect1

User is logged in on Car Rental page
    Navigate To Infotiv Car Rental Web Page
    Login with existing user credentials

Login with existing user credentials
    input text  id:email  VGstudent@iths.nu
    input text  id:password  secret
    click element  id:login
    Wait Until Page Contains  You are signed in as Inge

User chooses a valid date on Date Selection Page
    Choose current date and continue to Car Selection Page

User is on Car Selection Page
    Page Should Contain  What would you like to drive?

User clicks a button to book a Volvo V40
    Click Element  id:bookV40pass5

User submits valid credit card details on the Confirmation Page
    Wait Until Page Contains  Confirm booking of Volvo V40
    Input Text  id:cardNum  1234123412341234
    Input Text  id:fullName  Inge Likviditet
    Input Text  id:cvc  123

User clicks "Confirm" button
    Click Element  id:confirm

User gets confirmation of the booking
    Page Should Contain  A Volvo V40 is now ready for pickup

User can see the booked car on Users "My Page"
    Click Element  id:mypage
    Wait Until Page Contains Element  id:model1
    Element Should Contain  id:model1  V40

Delete Car Booking And Logout
    Click Element  id:mypage
    Click Element  id:unBook1
    Alert Should Be Present
    Click Element  id:mypage
    Page Should Contain  You have no bookings
    Click Element  id:logout

