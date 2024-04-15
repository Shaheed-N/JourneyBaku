//
//  Model.swift
//  BakuCafes
//
//  Created by Shahid on 08.04.24.
//


import CoreLocation

struct Cafe: Identifiable {
    let id = UUID()
    let name: String
    let location: CLLocationCoordinate2D
    let website: URL?
    let address: String
}


let cafes: [Cafe] = [
    Cafe(name: "Anadolu Restaurant", location: CLLocationCoordinate2D(latitude: 40.37649795934559, longitude: 49.853726101995754), website: URL(string: "https://anadolu.az/index.php?route=common/home"), address: "5 Alexander Pushkin, Baku 1010"),
    Cafe(name: "Central Baku", location: CLLocationCoordinate2D(latitude: 40.3730299608514,  longitude: 49.83873822954531), website: URL(string: "https://monyo.az/?r=centralbaku&l=2#monyo"), address: "75 Nizami St, Baku 1005"),
    Cafe(name: "LaQuzu", location: CLLocationCoordinate2D(latitude: 40.36858332584139,  longitude: 49.83676412382824), website: URL(string: "https://cafecity.az/products/laquzu/laquzu-menyu/qelyanaltilar"), address: "Küçəsi 41 Boyuk Qala, Bakı 1095"),
    Cafe(name: "Çay Bağı 145", location: CLLocationCoordinate2D(latitude: 40.36685036657345,  longitude: 49.83624913972813), website: nil, address: "3 Kichik Qala, Bakı 1000"),
    Cafe(name: "Soul Kitchen", location: CLLocationCoordinate2D(latitude: 40.36891029429148,  longitude: 49.83856656817859), website: URL(string: "https://www.google.com/url?url=http%3A%2F%2Fsoulkitchenfrombaku.weebly.com%2F&sa=t&rct=j&source=maps&usg=AOvVaw3ak5VgeQcgvb5ncQo4Uw6s&ved=1i%3A0%2Ct%3A3443%2Ce%3A34%2Cp%3AwKgTZrv9HeOOwPAPzsu_iAc%3A712"), address: "4 Mammadamin Rasul-Zadeh, Baku 0101"),
    Cafe(name: "Salam Baku Restaurant", location: CLLocationCoordinate2D(latitude: 40.36900838451721,  longitude: 49.835691240286366), website: nil, address: "Unvan, 126 Kichik Qala, Baku"),
    Cafe(name: "East Town", location: CLLocationCoordinate2D(latitude: 40.373429622087365,  longitude: 49.83996082563774), website: nil, address: "54 Nizami St, Baku"),
    Cafe(name: "Nakhchivan Restaurant", location: CLLocationCoordinate2D(latitude: 40.3646909256693,  longitude: 49.81907210681191), website: URL(string: "https://app.box.com/s/x45r2ituktnzintw57bhgg9evdel8wxd?utm_source=tripadvisor&utm_medium=referral"), address: "8a Parliament Ave, Baku"),
    Cafe(name: "Vapiano Baku", location: CLLocationCoordinate2D(latitude: 40.37164346834868,  longitude: 49.84119969091202), website: URL(string: "https://vapiano.com/"), address: "6 Uzeyir Hajibeyov St, Baku 1000"),
    Cafe(name: "Mari Vanna", location: CLLocationCoordinate2D(latitude: 40.372931876479036,  longitude: 49.84938123428073), website: URL(string: "https://ginza.ru/baku/restaurant/marivanna"), address: "93 Zərifə Əliyeva Küçəsi, Bakı"),
]
