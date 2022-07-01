import PalmBeach from "./PalmBeach.js";

const markup = (PalmBeach) => {
    return `
    <div class="container" id="palmbeach">
    <div class="row">
    <div class="col-lg">
        <h3>${PalmBeach.city}</h3>
        <p>${PalmBeach.city} is located in ${PalmBeach.region} in ${PalmBeach.country}.
        The population is about ${PalmBeach.population}. The climate is ${PalmBeach.climate} for most of the year
        and ${PalmBeach.famousFood} is the place to try. I ${PalmBeach.recommendation ? "would" : "would not"} that you lin in ${PalmBeach.city}.
        </p>
        </div>      <hr class="tsline">
    </div>
        <div class="row">
        <div class="col-lg">
        ${PalmBeach.image}
        </div>
    </div>
    </div>     
    
    <div class="row">
        <div class="col-lg-6">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/5-SEmpu5_yo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>        
        </div>

        <div class="col-lg-6">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/ezhLf4WG0s4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>        
        </div>

    </div>`
}

const main = document.createElement("main");
main.innerHTML = markup(PalmBeach);
document.body.appendChild(main);