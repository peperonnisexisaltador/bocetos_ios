//
//  Constantes.swift
//  Final
//
//  Created by alumno on 11/11/24.
//

import Foundation
struct Constantes{
    static var API_KEY = "AIzaSyAgbQjIA2TIqjOINj6c6tl5e3mS3Yqq6H4"
    static var PLAYLIST_ID = "PLGxV8JnoT5Qi7Hmy3-MTGeTJ-iAbjnmuU"
    static var URL_API = "https://www.googleapis.com/youtube/v3/playlistitems?part=snippet&playlistId=\(Constantes.PLAYLIST_ID)&key=\(Constantes.API_KEY)"
}
