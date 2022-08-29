// Package weather gets weather information for Goblinocus.
package weather

// CurrentCondition is the... uh... current condition. Pretty sure it's a string.
var CurrentCondition string
// CurrentLocation is the current location. Yep, definitely a string.
var CurrentLocation string

// Forecast lets you, the meteorologist, set the current forcast for a city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
