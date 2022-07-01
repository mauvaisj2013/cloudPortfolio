import Navigation from "./Navigation.js";


const markup = (Navigation) => {
    return `

    <nav class="navbar navbar-dark bg-primary" style="border-radius:0!important;">
    <button type="button" class="btn">${Navigation.home}</button>
    <button type="button" class="btn"> ${Navigation.daytonaBeach}</button>
    <button type="button" class="btn">${Navigation.FtLauderdale}</button>
    <button type="button" class="btn">${Navigation.gainesville}</button>   
    <button type="button" class="btn">${Navigation.keywest}</button> 
    <button type="button" class="btn">${Navigation.miami}</button>   
    <button type="button" class="btn">${Navigation.orlando}</button>    
    <button type="button" class="btn">${Navigation.palmbeach}</button> 
    <button type="button" class="btn">${Navigation.tallahassee}</button>   
    <button type="button" class="btn">${Navigation.tampa}</button>    
    </nav>  
    `
}

const main = document.createElement("main");
main.innerHTML = markup(Navigation);
document.body.appendChild(main);