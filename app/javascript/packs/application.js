import "bootstrap";
import "../plugins/flatpickr"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
import "flatpickr/dist/themes/airbnb.css" // A path to the theme CSS


flatpickr(".datepicker", {
});

const input = document.getElementById("end_date");
input.addEventListener("change", (event) => {
  const endDate = event.currentTarget.value;
  const startDate = document.getElementById("start_date").value;
  const timeDiff = Math.abs(new Date(endDate).getTime() - new Date(startDate).getTime());
  const diffDays = Math.abs(timeDiff / (1000 * 3600 * 24));
  const pricePerNight = parseInt(document.querySelector(".price-tag").dataset.price, 10);
  const fullPrice = diffDays * pricePerNight;
  const priceH2 = document.querySelector(".full-price");
  priceH2.innerText = `Total Pad price is £${fullPrice}`;
  if (priceH2.classList.contains("d-none")) {
    priceH2.classList.remove("d-none");
  }
})

// const padPrice = getPrice() + diffDays();

// document.getElementById('padPrice').innerHTML = "Total Pad price"+padPrice;
