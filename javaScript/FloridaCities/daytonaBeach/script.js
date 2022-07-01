import daytonaBeach from "./daytonaBeach.js";

const markup = (daytonaBeach) => {
    return `
    <div class="container" id="daytonaBeach">
    <div class="row">
    <div class="col-lg">
        <h3>${daytonaBeach.city}</h3>
        <p>${daytonaBeach.city} is located in ${daytonaBeach.region} in ${daytonaBeach.country}.
        The population is about ${daytonaBeach.population}. The climate is ${daytonaBeach.climate} for most of the year
        and ${daytonaBeach.famousFood} is the food to try. I ${daytonaBeach.recommendation ? "would" : "would not"} recommend that you live in ${daytonaBeach.city}.
        </p>
        </div>      <hr class="tsline">
    </div>
        <div class="row">
        <div class="col-lg">
        ${daytonaBeach.image}
        </div>
    </div>

    <div class="row">
    <div class="col-lg-6">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/p_x5lKpViR8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>

    <div class="col-lg-6">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/utwtGbq1vGA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>

    </div>      `
}

const main = document.createElement("main");
main.innerHTML = markup(daytonaBeach);
document.body.appendChild(main);