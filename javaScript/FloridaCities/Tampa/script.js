import Tampa from "./Tampa.js";

const markup = (Tampa) => {
    return `
    <div class="container" id="tampa">
    <div class="row">
    <div class="col-lg">
        <h3>${Tampa.city}</h3>
        <p>${Tampa.city} is located in ${Tampa.region} in ${Tampa.country}.
        The population is about ${Tampa.population}. The climate is ${Tampa.climate} for most of the year
        and ${Tampa.famousPlace} is the place to be. I ${Tampa.recommendation ? "would" : "would not"} that you lin in ${Tampa.city}.
        </p>
        </div>      <hr class="tsline">
    </div>
        <div class="row">
        <div class="col-lg">
        ${Tampa.image}
        </div>
    </div>
    </div>   
    
    <div class="row">
        <div class="col-lg-6">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/NkCtNaThbmE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>    
        </div>

        <div class="col-lg-6">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/0huATi9ytn4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>        
        </div>

    </div>`
}

const main = document.createElement("main");
main.innerHTML = markup(Tampa);
document.body.appendChild(main);