import FtLauderdale from "FtLauderdale.js";

const markup = (FtLauderdale) => {
    return `
    <div class="container" id="FtLauderdale">
    <div class="row">
    <div class="col-lg">
        <h3>${FtLauderdale.city}</h3>
        <p>${FtLauderdale.city} is located in ${FtLauderdale.region} in ${FtLauderdale.country}.
        The population is about ${FtLauderdale.population}. The climate is ${FtLauderdale.climate} for most of the year
        and ${FtLauderdale.famousFood} is the food to try. I ${FtLauderdale.recommendation ? "would" : "would not"} that you lin in ${FtLauderdale.city}.
        </p>
        </div>      <hr class="tsline">
    </div>
        <div class="row">
        <div class="col-lg">
        ${FtLauderdale.image}
        </div>
    </div>
    </div>      `
}

const main = document.createElement("main");
main.innerHTML = markup(FtLauderdale);
document.body.appendChild(main);