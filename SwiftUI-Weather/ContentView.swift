//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Nattapong thip on 18/9/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    @State private var isPresented = false

    var body: some View {
        NavigationView {
            ZStack {
                // State
                //            BackgroudView(topColor: isNight ? .black : .blue,
                //                          bottomColor: isNight ? .gray : Color("lightBlue"))
                
                // Binding
                BackgroudView(isNight: $isNight)
                VStack {
                    CityTextView(cityName: "นนทบุรี, บางใหญ่")
                    MainWeatherStatysView(imageName: isNight ? "moon.stars.fill" :"cloud.sun.fill",temperature: 32)
                    HStack(spacing: 20) {
                        WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 29, isNight: isNight)
                        WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 31, isNight: isNight)
                        WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.bolt.fill", temperature: 32, isNight: isNight)
                        WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.bolt.fill", temperature: 30, isNight: isNight)
                        WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.rain.fill", temperature: 28, isNight: isNight)
                    }
                    Spacer()
                    
                    Button {
                        isNight.toggle()
                    } label: {
                        WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Sub View
struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var isNight: Bool
    
    @State private var isPresented = false
    @State private var isNightMode: Bool = false

    var body: some View {
            VStack {
                NavigationLink(destination: WeatherDetailView(isNightDetail: isNight,cityNameDetail: "นนทบุรี, บางใหญ่",dayDetail: dayOfWeek, imageNameDetail:imageName, temperatureDetail: temperature )) {
                    VStack {
                        Text(dayOfWeek)
                            .font(.system(size: 16,weight: .medium, design: .default))
                            .foregroundColor(.white)
                        Image(systemName: imageName)
                            .renderingMode(.original)
                        //                .symbolRenderingMode(.multicolor)
                            .resizable()
                            .foregroundStyle(.pink, .orange, .green)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                        Text("\(temperature)°")
                            .font(.system(size: 28,weight: .medium))
                            .foregroundColor(.white)
                    }
                }
            }
        }
}

struct BackgroudView: View {
    
//    var topColor: Color
//    var bottomColor: Color

//    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomLeading)
//        .edgesIgnoringSafeArea(.all)
        
    @Binding var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomLeading)
////        .edgesIgnoringSafeArea(.all)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatysView: View {
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

//struct WeatherButton: View {
//    var title: String
//    var textColor: Color
//    var backgroundColor: Color
//
//    var body: some View {
//        Text(title)
//            .frame(width: 280, height: 50)
//            .background(backgroundColor)
//            .foregroundColor(textColor)
//            .font(.system(size: 20, weight: .bold, design: .default))
//            .cornerRadius(10)
//    }
//}

