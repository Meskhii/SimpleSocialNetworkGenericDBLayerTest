//
//  CoreDataStorageContext+Extension.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import Foundation
import CoreData

extension CoreDataStorageContext {

    func create<DBEntity: Storable>(_ model: DBEntity.Type) -> DBEntity? {
        let entityDescription =  NSEntityDescription.entity(forEntityName: String.init(describing: model.self),
                                                            in: managedContext!)
        let entity = NSManagedObject(entity: entityDescription!,
                                     insertInto: managedContext)
        return entity as? DBEntity
    }

    func save(object: Storable) throws {
        
        do {
            try managedContext!.save()
        } catch {
            print(error)
        }
        
    }

    func saveAll(objects: [Storable]) throws {
    }

    func update(object: Storable) throws {
    }

    func delete(object: Storable) throws {
    }

    func deleteAll(_ model: Storable.Type) throws {
    }

    func fetch(_ model: Storable.Type, predicate: NSPredicate?, sorted: Sorted?) -> [Storable] {
        
        var result = [Storable]()
        
        do {
            let request = NSFetchRequest<NSManagedObject>(entityName: String(describing: model.self))
            request.predicate = predicate
            result = try managedContext!.fetch(request)
        } catch {
            print(error)
        }
        return result
    }

    func objectWithObjectId<DBEntity: Storable>(objectId: NSManagedObjectID) -> DBEntity? {
        do {
            let result = try managedContext!.existingObject(with: objectId)
            return result as? DBEntity
        } catch {
            print("Failure")
        }

        return nil
    }
}
