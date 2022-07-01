import KeyWest from "./KeyWest.js";

const markup = (KeyWest) => {
    return `
    <div class="container" id="keywest">
    <div class="row">
    <div class="col-lg">
        <h3>${KeyWest.city}</h3>
        <p>${KeyWest.city} is located in ${KeyWest.region} in ${KeyWest.country}.
        The population is about ${KeyWest.population}. The climate is ${KeyWest.climate} for most of the year
        and ${KeyWest.famousFood} is the food to try. I ${KeyWest.recommendation ? "would" : "would not"} that you lin in ${KeyWest.city}.
        </p>
        </div>      <hr class="tsline">
    </div>
        <div class="row">
        <div class="col-lg">
        ${KeyWest.image}
        </div>
    </div>
    </div>     
    
    <div class="row">
        <div class="col-lg-6">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/KB6K5EONfOs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>

        <div class="col-lg-6">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/zoTmZpUiZ4s" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>

    </div>  `
}

const main = document.createElement("main");
main.innerHTML = markup(KeyWest);
document.body.appendChild(main);