import Tallahassee from "./Tallahassee.js";

const markup = (Tallahassee) => {
    return `
    <div class="container" id="tallahassee">
    <div class="row">
    <div class="col-lg">
        <h3>${Tallahassee.city}</h3>
        <p>${Tallahassee.city} is located in ${Tallahassee.region} in ${Tallahassee.country}.
        The population is about ${Tallahassee.population}. The climate is ${Tallahassee.climate} for most of the year
        and ${Tallahassee.famousPlace} is the place to be. I ${Tallahassee.recommendation ? "would" : "would not"} that you lin in ${Tallahassee.city}.
        </p>
        </div>      <hr class="tsline">
    </div>
        <div class="row">
        <div class="col-lg">
        ${Tallahassee.image}
        </div>
    </div>
    </div>   
    
    <div class="row">
        <div class="col-lg-6">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/g8cFFvO25qU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>        
        </div>

        <div class="col-lg-6">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/6jAw8n8kxOo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>        
        </div>

    </div>`
}

const main = document.createElement("main");
main.innerHTML = markup(Tallahassee);
document.body.appendChild(main);