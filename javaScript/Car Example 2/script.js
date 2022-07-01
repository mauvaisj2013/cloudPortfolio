import myCar from "./mycar.js";

const markup = (myCar) => {
    return `
    <div>
        <h3>${myCar.name}</h3>
        <ul>
        <li>Year:${myCar.year}</li>
        <li>Make:${myCar.make}</li>
        <li>Model:${myCar.model}</li>
        <li>Number of miles for Trip A:${myCar.milesDriven.tripA}</li>
        <li>Number of miles for Trip B:${myCar.milesDriven.tripB}</li>
        <li>Number of miles for Trip C:${myCar.milesDriven.tripC}</li>
        <li>Who's in the car?:${myCar.passengers.group}</li>
        <li>Driver of the car:${myCar.passengers.driver}</li>
        <li>Person next to the driver:${myCar.passengers.shotgun}</li>
        <li>Backseat passenger 1:${myCar.passengers.rearLeft}</li>
        <li>Backseat passenger 2:${myCar.passengers.rearRight}</li>
        <li>Is the AC on or off?:${myCar.ACOn ? "On" : "Off"}</li>
        </ul>
    <div>   `
}

const main = document.createElement("main");
main.innerHTML = markup(myCar);
document.body.appendChild(main);