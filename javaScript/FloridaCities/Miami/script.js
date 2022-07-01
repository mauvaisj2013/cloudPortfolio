import Miami from "./Miami.js";

const markup = (Miami) => {
    return `
    <div class="container" id="miami">
    <div class="row">
    <div class="col-lg">
        <h3>${Miami.city}</h3>
        <p>${Miami.city} is located in ${Miami.region} in ${Miami.country}.
        The population is about ${Miami.population}. The climate is ${Miami.climate} for most of the year
        and ${Miami.famousFood} is the food to try. I ${Miami.recommendation ? "would" : "would not"} that you lin in ${Miami.city}.
        </p>
        </div>      <hr class="tsline">
    </div>
        <div class="row">
        <div class="col-lg">
        ${Miami.image}
        </div>
    </div>
    </div>    

    <div class="row">
        <div class="col-lg-6">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/OeLpcEKVy50" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>    
        </div>

        <div class="col-lg-6">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/xSZe0QQniXU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>        
        </div>

    </div>  `
}

const main = document.createElement("main");
main.innerHTML = markup(Miami);
document.body.appendChild(main);