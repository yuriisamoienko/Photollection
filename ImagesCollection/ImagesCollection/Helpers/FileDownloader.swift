//
//  FileDownloader.swift
//  ImagesCollection
//
//  Created by Yurii Samoienko on 08.12.2022.
//

import Foundation

protocol FileDownloaderPl {
    func load(from url: URL) async throws -> Data
}

actor FileDownloader: FileDownloaderPl {
    
    static let shared: FileDownloaderPl = FileDownloader() //TODO inject instead
    
    private let fileManager = FileManager.default
    
    private enum DownloadStatus {
        case progress
        case done
        case failed
    }
    
    private var downloads: [URL: DownloadStatus] = [:]
    
    // MARK: FileDownloaderPl
    
    func load(from url: URL) async throws -> Data {
        let cacheFolder = fileManager
            .documentsDirectory
            .appendingPathComponent("ImagesCache", isDirectory: true)
        
        // create cacheFolder if not exists
        if !fileManager.fileExists(atPath: cacheFolder.path) {
            try fileManager.createDirectory(at: cacheFolder, withIntermediateDirectories: false)
        }
        
        // Compute a path to the URL in the cache
        let cachedFile = cacheFolder
            .appendingPathComponent(
                url.absoluteString.urlEncoded(),
                isDirectory: false
            )
        
        // If the image exists in the cache,
        // load the image from the cache and exit
        if let data = try? Data(contentsOf: cachedFile) {
            return data
        }
        
        // If the image does not exist in the cache,
        // download the image to the cache
        try await download(url: url, toFile: cachedFile)
        
        let data = try Data(contentsOf: cachedFile)
        return data
    }
    
    // MARK: Private Functions
    
    private func download(url: URL, toFile file: URL) async throws {
        // Download the remote URL to a file
        
        // avoid multiple downloading of the same url
        if downloads[url] == .progress {
            repeat {
                try await Task.sleep(nanoseconds: 10000000) // 0.01sec
            } while downloads[url] == .progress
        }
        
        downloads[url] = .progress
        do {
            let (tempURL, _) = try await URLSession.shared.download(from: url)
            
            
            // Remove an existing file
            if fileManager.fileExists(atPath: file.path) {
                try fileManager.removeItem(at: file)
            }
            
            // Copy the tempURL to file
            try FileManager.default.copyItem(
                at: tempURL,
                to: file
            )
            downloads[url] = .done
        } catch {
            print(error.localizedDescription)
            downloads[url] = .failed
            throw error
        }
    }
    
}
