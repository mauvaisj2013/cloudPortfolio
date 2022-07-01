import Orlando from "./Orlando.js";

const markup = (Orlando) => {
    return `
    <div class="container" id="orlando">
    <div class="row">
    <div class="col-lg">
        <h3>${Orlando.city}</h3>
        <p>${Orlando.city} is located in ${Orlando.region} in ${Orlando.country}.
        The population is about ${Orlando.population}. The climate is ${Orlando.climate} for most of the year
        and ${Orlando.famousFood} is the food to try. I ${Orlando.recommendation ? "would" : "would not"} that you lin in ${Orlando.city}.
        </p>
        </div>      <hr class="tsline">
    </div>
        <div class="row">
        <div class="col-lg">
        ${Orlando.image}
        </div>
    </div>
    </div>    
    
    <div class="row">
        <div class="col-lg-6">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/2fo4CLWPKYg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>        
        </div>

        <div class="col-lg-6">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/mT4VlO3Xh8k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>        
        </div>

    </div>    `
}

const main = document.createElement("main");
main.innerHTML = markup(Orlando);
document.body.appendChild(main);