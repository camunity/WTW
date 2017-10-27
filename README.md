# whatstheweather
Sample App For C4Q

// Goals:

Verify that you are able to obtain a JSON response from the API, and familiarize yourself with the JSON results. DONE

Write code to retrieve the weather forecast with an HTTP GET request, and parse the JSON response it returns. DONE

Write an app that shows forecasted low and high temperatures for each day in the forecast. DONE

Create a GitHub repo and commit your app to it. DONE

For each day, show the icon corresponding to the forecast weather. DONE

Add an interactive control to toggle between Farenheit and Celcius temperatures. DONE


// Reflections:

I made some (architecture/UI) design mistakes early on into coding this project that cost me a lot of time. Albeit completely unordinary of me,
I think my nervousness led me to think too quickly about style/UI implementations rather than jump right into development. I normally prioritize function
over aesthetic but like I said... I got nervous lol. Those same nerves led to some structural design problems while I attempted to separate my data model from
my class object in order to properly return the JSON. I wanted my structure of the project to be clean, professional, and organized with functions
returning data in proper scope. Furthermore, while I successfully implemented it, I only recently learned about the new JSON Serialization techniques 
in Swift 4 using the Codable Protocol and without functioning JSON I couldn't work much of anything... That being said after confirming that I was receiving 
data I went on to implement my TableView and populate it with the weather data. By this point because of poor pacing due to the aforementioned errors
I was running out of time in the challenge and rushed to have the TableView visualize the data even if poorly. I got up to having my cells read the highs and lows
in Farenheit by the end of the 3 hours alotted initially. At this point I pushed my first commit. Because I was well aware of what else needed to be done, and wanted to prove myself a determined and enduring programmer despite these setbacks I continued to work on the code until I addressed each segment of the challenge comfortably. I quickly added a SegmentedControl to the View and
implemented the necessary methods when the segmented control was toggled. I was able to add the code to change the cells from Farenheit to Celsius but
at this point the cells' design still needed work. They were missing a formatted Date as well as the image icon. I created a new TableViewCell prototype and 
began working on modifying my data response in JSON to format the dates correctly and pass the modified array of WeatherObjects. 

There are still bugs in this app, such as the improper resize of the images when the tableviewcell is selected, while this may seem intentional upon
user interaction I assure you it is not implemented purposefully in this code. With more time to work on this app, I would address that issue, refactor my code to make sure I'm error checking more properly, Add a show segue from the tableviewcell to a new viewcontroller where more details 
about the forecast can be displayed, and all in all beautify my app more. I had the idea of adding sound recordings and other cool unique user flows but
had to remember the hard (error-prone) way the lesson of prioritizing my MVP before adding the bells and whistles.

It would mean a lot to me if my project can be looked at in it's entirety with consideration of everything I've mentioned and judged accordingly

As students we make many mistakes, 
As developers we make many mistakes, and
as teachers we make many mistakes...

I hope this work goes to show that while I am
no superhero developer able to drag and drop objects in Interface Builder using telekenesis, I am very committed to working through my many mistakes
and ensuring that my final product is something people can learn from.


All my best dear reader,

Cam
