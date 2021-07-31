component accessors = true {
    property markdownService;

    function default ( rc ) {
        savecontent variable = "md" {
            writeOutput('
            
![Cover](https://static.kisdigital.com/images/marvel/00_anthology.jpeg)

The Marvel Cinematic Universe is the shared universe of superhero films based on characters that appear in American comic books published by Marvel Comics. Since I have largely been working from home since the onset of COVID-19, I thought it might be a good time to go through the list of movies and create a playlist of all the movies in order.

###### Captain America: The First Avenger (2011)
![Captain America](https://static.kisdigital.com/images/marvel/01_captain_america.png)

Set during World War II, Steve Rogers, a sickly man, is transformed into the super-soldier Captain America and must stop the Red Skull from using the Tesseract as an energy-source for world domination.

###### Captain Marvel (2019)
![Captain Marvel](https://static.kisdigital.com/images/marvel/02_captain_marvel.jpeg)

Set in 1995, Carol Danvers becomes one of the universes most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.


            ');
        }
       rc.content =  markdownService.toHtml(md);    
    }
}