# Medimind
An app used to input prescriptions for medicine with the time to take and the quantity of medicine the user has. Then it reminds the user when to take the medicine and keeps track of when to head to the pharmacy to buy more. It uses Flutter and Hive

# Features:
> Add a prescribed medicine
>> Set the duration of taking the medicine
>> Set the number of pills currently owned by the patient (user)
>>> Allow that number to be changed manually once new medicine is bought
>>> Track the number of pills currently owned
>> Set the time for when the medicine must be taken (e.g. weekly at 7pm or daily after lunch)
>> Set the period throughout the medicine must be taken (e.g. 14 days)

> Remind the user to take the medicine
>> Take confirmation that the medicine was taken
>>> Count the number of times the medicine was taken on time
>>> Automatically decrement the number of pills owned by the user

> This will be organised in the following way:

> Accessed using the navigation bar:

>> A home page displaying:
>>> Next medicine to take and when to take it
>>> Medicine closest to running out and advise on buying more or not depending on the prescribed period of buying

>> "Add new medicine" button to add a new medicine and all the data needed to do so
>>> Data is stored locally using Hive

>> Page to show all currently prescribed medicine

>> Accessed in the drawer:

>> Settings:
>>> Light/Dark Mode
>>> Automatically delete medicines after completing prescriptions
>>> Frequency of reminders and how close they are to the actual prescribed time to take the medicine.