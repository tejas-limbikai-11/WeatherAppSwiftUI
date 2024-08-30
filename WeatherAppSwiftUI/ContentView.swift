//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Tejas Limbikai on 29/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack{
                cityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: isNight ? 14 : 27,
                    isNight: isNight
                )
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                   temperature: isNight ? 17 : 26)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: isNight ? "cloud.moon.fill" : "sun.max.fill",
                                   temperature: isNight ? 16 : 32)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: isNight ? 14 : 23)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: isNight ? "moon.haze.fill" : "sunset.fill",
                                   temperature: isNight ? 18 : 28)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: isNight ? "cloud.moon.rain.fill" : "snow",
                                   temperature: isNight ? 16 : 21)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,
                             isNight ? .gray : Color("lightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct cityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var isNight: Bool
    
    var body: some View {
        VStack(spacing: isNight ? 50 : 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: isNight ? 140 : 180, height: isNight ? 140 : 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
