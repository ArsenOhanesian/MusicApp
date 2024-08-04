//
//  ImportFileManager.swift
//  MusicApp
//
//  Created by arsen on 02.08.2024.
//

import SwiftUI
import AVFoundation
import RealmSwift

/// ImportFileManager can select and import audio files in application
struct ImportFileManager: UIViewControllerRepresentable{
    
    /// Coordinator manage tasks between SwiftUI and UIKit
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    /// Method for create and configure UIDocumentViewPicker, which use for select audio files
    func makeUIViewController(context: Context) -> some UIDocumentPickerViewController {
        
        /// Premission open files with type "public.audio" ( MP3, WAV)
        let picker = UIDocumentPickerViewController(documentTypes: ["public.audio"], in: .open)
        
        /// Permission to select only one file
        picker.allowsMultipleSelection = false
        
        /// Show extension of file
        picker.shouldShowFileExtensions = true
        
        /// Setup coordinator as delegate
        picker.delegate = context.coordinator
        
        return picker
    }
    
    /// Method for update controller with new data, In this case he is empty, becouse all of needed settings are completeded after creating
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    /// Coordinator is connecting link between UIDocumentPicker and ImportFileManager
    class Coordinator: NSObject, UIDocumentPickerDelegate{
        // MARK: - Properties
        /// Link on parent component ImportFileManeger
        var parent: ImportFileManager
        @ObservedResults(SongModel.self) var songs
        
        // MARK: - Initializator
        init(parent: ImportFileManager) {
            self.parent = parent
        }
        
        
        // MARK: - Methods
        /// This method called when user selected a song
        /// And method processes url and create a song with type SongModel
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            
            /// Guard let, safely extract first element of array with urls. If array is empty - urls.first return nil and condition guard will not miss, which will result in an exit of documentPicker
            /// After extracting url, method startAccessingSecurityScopedResource called for start acces to secured resource
            guard let url = urls.first, url.startAccessingSecurityScopedResource() else { return }
            
            /// Defer assure that  method stopAccessingSecurityScopedResource will called when documentPicker finished, regadles successful or not and secure resource will be closed and correct removed from memory
            defer{ url.stopAccessingSecurityScopedResource() }
            
            
            do{
                /// Get data of file
                let document = try Data(contentsOf: url)
                
                /// Creating AVAsset for unpacking metadata
                let asset = AVAsset(url:url)
                
                /// Initialization of object SongModel
                var song = SongModel(name: url.lastPathComponent, data: document)
                
                /// Loop for iteration of metadata from audio file
                let metadata = asset.metadata
                for item in metadata{
                    
                    /// Cheking if there is metadata with key / value
                    guard let key = item.commonKey?.rawValue, let value = item.value else { continue }
                    switch key{
                    case AVMetadataKey.commonKeyArtist.rawValue: song.author = value as? String
                    case AVMetadataKey.commonKeyArtwork.rawValue: song.coverImage = value as? Data
                    case AVMetadataKey.commonKeyTitle.rawValue: song.name = value as? String ?? song.name
                    default: break
                    }
                }
                
                /// Get duration of song
                song.duration = CMTimeGetSeconds(asset.duration)
                
                let isDublicate = songs.contains {$0.name == song.name && $0.author == song.author }
                
                /// Adding song to array of songs if this song no exist
                if isDublicate {
                    $songs.append(song)
                } else{
                    print("Error song with the same name already added!")
                }
                
            } catch{
                print("Error processing the file: \(error.localizedDescription)")
            }
        }
    }
}
