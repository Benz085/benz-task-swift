//
//  WeatherDetailView.swift
//  SwiftUI-Weather
//
//  Created by Nattapong thip on 25/12/2566 BE.
//

import SwiftUI

struct WeatherDetailView: View {
    @State
    var isNightDetail: Bool
    var cityNameDetail: String
    var dayDetail: String
    var imageNameDetail: String
    var temperatureDetail: Int
    
    var body: some View {
        ZStack {
            BackgroudDetailView(isNight: isNightDetail)
            VStack {
                CityDetailTextView(cityName: cityNameDetail)
                DayDetailTextView(dayText: dayDetail)
                MainDetailWeatherStatysView(imageName: imageNameDetail,temperature: temperatureDetail)
            }
        }
        .navigationBackButton(color: isNightDetail ? .white : .black, text: "ย้อนกลับ")
    }
}


struct BackgroudDetailView: View {
    @State var isNight: Bool
    var body: some View {
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}


struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(isNightDetail: false,
                          cityNameDetail: "นนทบุรี, บางใหญ่",
                          dayDetail: "MON",
                          imageNameDetail: "cloud.sun.fill",
                          temperatureDetail: 18
        )
    }
}

struct DayDetailTextView: View {
    var dayText: String
    var body: some View {
        Text(dayText)
            .font(.system(size: 28,weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CityDetailTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 26,weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainDetailWeatherStatysView: View {
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

struct NavigationBackButton: ViewModifier {
    
    @Environment(\.presentationMode) var presentationMode
    var color: UIColor
    var text: String?
    
    func body(content: Content) -> some View {
        return content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {  presentationMode.wrappedValue.dismiss() }, label: {
                    HStack(spacing: 2) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color(color))
                            .bold()
                        
                        if let text = text {
                            Text(text)
                                .foregroundColor(Color(color))
                                .bold()
                        }
                    }
                })
            )
    }
}

extension View {
    func navigationBackButton(color: UIColor, text: String? = nil) -> some View {
        modifier(NavigationBackButton(color: color, text: text))
    }
}
