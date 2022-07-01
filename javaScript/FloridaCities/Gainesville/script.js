import Gainesville from "./Gainesville.js";

const markup = (Gainesville) => {
    return `
    <div class="container" id="Gainesville">
    <div class="row">
    <div class="col-lg">
        <h3>${Gainesville.city}</h3>
        <p>${Gainesville.city} is located in ${Gainesville.region} in ${Gainesville.country}.
        The population is about ${Gainesville.population}. The climate is ${Gainesville.climate} for most of the year
        and ${Gainesville.famousFood} is the food to try. I ${Gainesville.recommendation ? "would" : "would not"} that you lin in ${Gainesville.city}.
        </p>
        </div>      <hr class="tsline">
    </div>
        <div class="row">
        <div class="col-lg">
        ${Gainesville.image}
        </div>
    </div>

    <div class="row">
         <div class="col-lg-6">
         <iframe width="560" height="315" src="https://www.youtube.com/embed/UzOHoJX-EJQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>

        <div class="col-lg-6">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/eGsXqS6kehk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>    
        </div>
    </div>

    </div>      `
}

const main = document.createElement("main");
main.innerHTML = markup(Gainesville);
document.body.appendChild(main);